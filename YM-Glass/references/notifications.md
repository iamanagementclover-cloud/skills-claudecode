# YM-Glass — Notifications et feedback

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

**Ici, le réel diverge de l'intuition "tout doit être en verre teinté".** Toasts et tooltips du produit sont des **surfaces pleines**, pas glass — c'est un choix délibéré et cohérent : ce sont des éléments transitoires/petits, un fond glass dessus serait illisible et le flou d'un si petit élément flottant serait un signal de mouvement parasite. Le glass est réservé aux surfaces persistantes de contenu (cartes, menus, modales) ; les micro-feedbacks restent solides pour rester nets.

## 1. Toast (`sonner.tsx`)

Bibliothèque **sonner**, pas un composant maison. Style réel :

```js
style={{
  "--normal-bg": "var(--popover)",       // fond plein, PAS glass
  "--normal-text": "var(--popover-foreground)",
  "--normal-border": "var(--border)",
  "--border-radius": "var(--radius)",     // 12px
}}
```

| Propriété | Valeur |
|---|---|
| Fond | `var(--popover)` — plein (`oklch(1 0 0)` clair / `oklch(0.185 0.02 265)` sombre), pas de blur |
| Bordure | `var(--border)` |
| Rayon | `var(--radius)` (12px) |
| Icône par type | `CircleCheckIcon` (succès), `InfoIcon` (info), `TriangleAlertIcon` (avertissement), `OctagonXIcon` (erreur), `Loader2Icon` animé (chargement) — **la couleur vient de l'icône, pas d'une teinte de fond différente par type** ; le fond reste `--popover` neutre dans tous les cas |
| Position | gérée par sonner (`bottom-right` par défaut) |

C'est le seul endroit du système avec un rôle "info" à part entière (`InfoIcon`, sonner l'a nativement) — ne pas en déduire un token `--info` réutilisable ailleurs, ça reste spécifique au toast.

## 2. Tooltip (`tooltip.tsx`)

Solide **inversé**, pas glass non plus :

| Propriété | Valeur |
|---|---|
| Fond | `bg-foreground` (inversion volontaire — presque noir en clair, presque blanc en sombre) |
| Texte | `text-background` (inverse aussi) |
| Rayon | `rounded-md` → `var(--radius-md)` (9px) |
| Padding | `px-3 py-1.5` |
| Typo | `text-xs` |
| Flèche | 10px, `rotate-45`, même couleur que le fond |
| Animation | `fade-in-0 zoom-in-95` à l'ouverture / `fade-out-0 zoom-out-95` à la fermeture, déclenché par `data-state` |
| Délai | `TooltipProvider delay={0}` dans le code actuel — pas de délai avant apparition (à ajuster si trop agressif, mais c'est la valeur en place) |

## 3. Badge (`badge.tsx`)

| Propriété | Valeur |
|---|---|
| Hauteur | `h-5` (20px) |
| Padding | `px-2 py-0.5` |
| Rayon | `rounded-4xl` → `var(--radius-4xl)` (31.2px — pleinement arrondi vu la hauteur) |
| Typo | `text-xs font-medium` |
| Icône interne | `size-3` (12px) |

Variantes **réellement définies** dans le code — ne pas en inventer d'autres sans suivre le même pattern :

| Variant | Fond | Texte |
|---|---|---|
| `default` | `bg-primary` (plein) | `text-primary-foreground` |
| `secondary` | `bg-secondary` (plein) | `text-secondary-foreground` |
| `destructive` | `bg-destructive/10` (clair) / `bg-destructive/20` (sombre) — **teinté, pas plein** | `text-destructive` |
| `outline` | transparent, `border-border` | `text-foreground` |
| `ghost` | transparent | hover `bg-muted` |
| `link` | transparent | `text-primary`, souligné au survol |

Il n'existe **pas** de variant `success`/`warning` tout fait dans `badge.tsx`. Pour un badge de statut succès/avertissement, suivre exactement le pattern `destructive` (teinté 10%/20% clair/sombre) en substituant le token : `bg-success/10 text-success` (clair) / `dark:bg-success/20`, et pareil pour `warning`. Ne pas leur donner un fond plein comme `default` — la dissymétrie (marque = plein, statuts = teinté) est le pattern réel, la respecter.

## 4. Indicateur de progression (`progress.tsx`)

| Propriété | Valeur |
|---|---|
| Piste | `h-1` (4px), `rounded-full`, `bg-muted` |
| Remplissage | `bg-primary`, `transition-all` |
| Libellé | `text-sm font-medium` |
| Valeur | `text-sm text-muted-foreground`, `.tabular-nums` — essentiel pour un pourcentage qui change dans le temps sans faire "sauter" la largeur du texte |

Pas de variante "indéterminée" dans le composant actuel — pour un chargement sans progression connue, utiliser `Loader2Icon` en rotation (voir §6) plutôt qu'une barre animée en boucle.

## 5. Indicateur de chargement (spinner)

`Loader2Icon` (lucide) + `animate-spin` (classe Tailwind standard, rotation continue). Couleur `currentColor` par défaut — hérite du texte du bouton/conteneur qui l'utilise. Ne jamais combiner spinner + barre de progression pour la même opération.

## 6. Alerte (inline) et bannière

Pas de composant shadcn dédié dans le projet à ce jour — à construire sur les mêmes tokens que le badge destructif : fond teinté 10%/20% (`bg-{role}/10` clair, `dark:bg-{role}/20` sombre), texte `text-{role}` plein, bordure `border-{role}/20`. Padding 16px, `rounded-md`. Icône lucide à gauche du rôle (`TriangleAlertIcon` avertissement, `OctagonXIcon` erreur, `CircleCheckIcon` succès, `InfoIcon` information). Bannière = même traitement, pleine largeur, pas de rayon si collée au bord du viewport.

## 7. Comportement mobile

Toast : pleine largeur avec marges, empilement vertical identique au desktop (géré par sonner). Tooltip : `TooltipProvider` reste actif mais le survol n'existe pas au tactile — prévoir un affichage alternatif (tap-and-hold ou information toujours visible) pour tout contenu critique porté uniquement par un tooltip.
