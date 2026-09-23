# YM-Glass — États visuels globaux

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

États qui ne sont pas liés à un composant précis mais à l'application ou une page entière.

## 1. Écran de chargement (initial)

Fond `.lg-canvas` (voir [design-tokens.md](design-tokens.md) §8) + spinner (`Loader2Icon animate-spin`, `text-primary`) centré. Ne pas afficher avant 200ms (éviter le flash sur chargement rapide).

## 2. Skeleton loading (`skeleton.tsx`)

**Le composant réel n'utilise pas un effet de balayage ("shimmer") mais une pulsation d'opacité** :

```tsx
<div className="animate-pulse rounded-md bg-muted" />
```

| Propriété | Valeur |
|---|---|
| Fond | `bg-muted` (plein — `oklch(0.96 0.008 265)` clair / `oklch(0.24 0.018 265)` sombre) |
| Rayon | `rounded-md` → `var(--radius-md)` (9px), ajusté selon la forme reproduite (`rounded-full` pour un avatar, etc.) |
| Animation | `animate-pulse` (Tailwind standard — opacité oscillant, pas de dégradé qui traverse) |

Le skeleton doit **reproduire la mise en page réelle** (mêmes proportions, mêmes emplacements) — jamais un rectangle générique unique pour une zone complexe. Ne pas réintroduire un shimmer en dégradé : ce n'est pas le pattern du produit, `animate-pulse` + `bg-muted` suffit et reste cohérent avec tous les autres skeletons déjà en place.

## 3. État vide

Icône lucide (`text-muted-foreground`, 32-40px) + titre court + description optionnelle + action optionnelle ("Créer le premier élément"), centré verticalement et horizontalement dans le conteneur concerné.

## 4. État d'erreur

Icône `OctagonXIcon` `text-destructive` + message clair (pas de jargon technique brut) + bouton "Réessayer" et/ou "Retour".

## 5. Page introuvable (404)

Composition centrée pleine page : grand numéro/icône décoratif + "Page introuvable" + lien de retour à l'accueil. Ton neutre — `text-muted-foreground`, pas `text-destructive` (ce n'est pas une erreur système).

## 6. Accès refusé (403)

Icône cadenas, message expliquant l'absence de droit sans révéler d'information sensible, action "Retour" ou "Demander l'accès" selon contexte.

## 7. Session expirée

Modale `information` (voir [dialogs.md](dialogs.md), niveau `lg-4`) plutôt que redirection brutale — préserve le contexte utilisateur, "Se reconnecter" réouvre l'auth sans perdre la page courante si possible.

## 8. Données indisponibles

Distinct de "vide" : les données existent mais ne peuvent pas être chargées maintenant. Icône `TriangleAlertIcon` `text-warning` + "Données temporairement indisponibles" + horodatage de dernière tentative + "Réessayer".

## 9. Contenu partiellement chargé

Zones chargées affichées normalement, zones en attente en `Skeleton` (§2) — jamais bloquer l'affichage complet de la page pour une seule section lente.

## 10. Action en cours / réussie / échouée

- **En cours** : bouton déclencheur → `Loader2Icon animate-spin` remplace ou précède le texte, largeur figée pour éviter un saut de layout, `disabled`
- **Réussie** : `CircleCheckIcon` bref (600ms) avant retour à l'état normal, ou toast succès (voir [notifications.md](notifications.md))
- **Échouée** : toast/alerte erreur, le composant revient à son état normal pour permettre une nouvelle tentative

## 11. État désactivé (global)

`opacity-45`, `cursor: not-allowed`, suppression des transitions de survol — cohérent quel que soit le composant.

## 12. État hors ligne

Bannière persistante (voir [notifications.md](notifications.md) §6), rôle `warning`, icône éclair barré. Le produit a un vrai mode offline-first (POS hors-ligne) — cette bannière doit rassurer ("vos ventes sont enregistrées, synchronisation au retour du réseau"), pas alarmer comme une vraie erreur.

## 13. Bannière de maintenance

`warning` ou `info` (icône `InfoIcon`) selon l'imminence, sous la navigation principale, fenêtre horaire si connue, ne masque jamais une action critique en cours (ex. une vente au comptoir).
