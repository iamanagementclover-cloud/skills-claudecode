# YM-Glass — Boîtes de dialogue

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

Dans le vrai produit : `[data-slot="dialog-content"]` et `[data-slot="sheet-content"]` (`src/app/globals.css:427-433`). C'est le niveau de verre **le plus opaque** du système — normal, une modale est toujours au premier plan, au-dessus d'autres surfaces glass, elle a besoin de plus de matière pour rester lisible.

## 1. Structure commune à toutes les modales

| Élément | Spécification réelle |
|---|---|
| Overlay | `[data-slot="dialog-overlay"]` : `background: var(--lg-scrim)` (`rgba(20,26,35,.28)` clair / `rgba(0,0,0,.5)` sombre) + `backdrop-filter: blur(6px)` — **l'overlay est flouté aussi**, ce n'est pas un simple assombrissement plat |
| Surface | `lg-4` : fond `rgba(210,214,220,.38)` clair / `rgba(255,255,255,.18)` sombre, `backdrop-filter: blur(14px) saturate(210%)`, bordure `var(--lg-4-border)`, ombre `var(--lg-4-shadow)` |
| Largeur min | 320px |
| Largeur max | 560px (standard) / 720px (formulaire long) / 960px (contenu long) |
| Hauteur max | 85vh, contenu interne scrollable au-delà |
| Scroll | header et actions fixes ; seul le corps scrolle |
| Padding | 24px sur tous les côtés, 16px en dessous de 640px |
| Rayon | `var(--radius-xl)` (16.2px) desktop, 0 en plein écran mobile |
| Position | centrée verticalement et horizontalement (desktop), collée en bas ou plein écran (mobile, §9) |

```css
[data-slot="dialog-content"],
[data-slot="sheet-content"] {
  background: var(--lg-4-bg);
  backdrop-filter: blur(var(--lg-4-blur)) saturate(var(--lg-4-sat));
  border: 1px solid var(--lg-4-border);
  box-shadow: var(--lg-4-shadow);
}
[data-slot="dialog-overlay"],
[data-slot="sheet-overlay"] {
  background: var(--lg-scrim);
  backdrop-filter: blur(6px);
}
```

N'oublie pas le halo spéculaire (`::before`, voir [design-tokens.md](design-tokens.md) §5) — c'est lui qui donne au bord supérieur de la modale son reflet de verre, pas seulement la bordure `lg-4-border`.

## 2. Anatomie

- **En-tête** : titre (`text-lg`, `font-semibold`, `text-foreground`) + description optionnelle (`text-sm`, `text-muted-foreground`) + bouton fermer (icône lucide 20px, coin haut-droit, zone cliquable 40×40px min)
- **Contenu** : hérite typo standard (`font-sans` = Geist)
- **Actions** : alignées à droite (desktop), empilées pleine largeur (mobile), bouton principal à droite/en haut de pile, `gap: 12px`

## 3. Variantes

| Variante | Icône en-tête | Couleur accent | Bouton principal |
|---|---|---|---|
| Standard | aucune | neutre | fond `--primary` (vert), texte `--primary-foreground` (sombre) |
| Confirmation | `?` | `--muted-foreground` (pas de rôle "info" — voir tokens §2) | `--primary` |
| Information | `i` cercle | `--muted-foreground` | `--primary`, un seul bouton "OK" |
| Avertissement | triangle | `--warning` | `--primary` ou `--warning` selon gravité |
| Suppression | corbeille | `--destructive` | fond `var(--lg-destructive-bg)`/bordure `var(--lg-destructive-border)` (verre teinté rouge, pas un rouge plein) ; focus par défaut sur "Annuler", jamais sur le bouton destructif |
| Formulaire | aucune | neutre | désactivé (`opacity-45`) tant que validation KO |
| Contenu long | aucune | neutre | corps scrollable, ombre interne haut/bas indiquant scroll disponible |
| Multi-étapes | indicateur d'étape sous le titre | neutre | "Suivant" à droite, "Précédent" à gauche |
| Chargement | — | — | contenu → skeleton, actions désactivées |
| Erreur | croix `--destructive` | `--destructive` | "Réessayer" + "Fermer" |
| Succès | check `--success` | `--success` | un seul bouton "OK" |

Bouton primaire plein (pas glass) : fond `var(--primary)`, texte `var(--primary-foreground)` (texte **sombre** — le vert est clair, un texte blanc dessus ne passerait pas le contraste). Bouton destructif "verre teinté" plutôt que rouge plein : fond `var(--lg-destructive-bg)`, hover `var(--lg-destructive-bg-hover)`.

## 4. États et interactions

- **Clic sur l'overlay** : ferme — sauf formulaire avec saisie non vide (confirmer avant fermeture) et variante chargement (aucune fermeture possible)
- **Échap** : identique
- **Focus** : piégé dans la modale (Tab ne sort pas) ; à la fermeture, retour au déclencheur

## 5. Animations

- **Apparition** : overlay fondu + modale fondu + scale `.96→1` + translation `8px→0`, ~200ms, easing standard
- **Fermeture** : inverse, ~120ms, sans scale (plus réactif)

## 6. Comportement mobile (< 768px)

`standard`/`confirmation`/`information`/`avertissement`/`suppression` → feuille ancrée en bas (`Sheet`, déjà le composant réel utilisé côté produit pour ce pattern), rayon uniquement sur les coins hauts. `formulaire`/`contenu long`/`multi-étapes` → plein écran (§7).

## 7. Modale plein écran mobile

- Pas de rayon, pas d'ombre, 100vh/100vw
- En-tête fixe avec flèche retour au lieu de croix
- Actions fixes en bas, sticky, séparées par `border-color: var(--border)`
- Entrée : translation verticale depuis le bas, ~320ms

## 8. État de chargement

Corps → skeleton (voir [global-states.md](global-states.md)) ou spinner centré. Actions désactivées (`opacity-45`) sauf "Annuler/Fermer" (reste actif sauf opération non annulable).

## 9. États d'erreur/succès inline

Bandeau inline en haut du corps (voir [notifications.md](notifications.md) §alerte), sans changer le fond `lg-4` de la modale elle-même.
