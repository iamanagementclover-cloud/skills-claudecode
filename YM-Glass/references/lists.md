# YM-Glass — Listes

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

Pas de primitive shadcn dédiée "liste" dans le projet — une liste est presque toujours construite à la main dans une `Card` (`lg-2`) ou un `sidebar-inner` (`lg-1`). La liste elle-même reste transparente, le niveau de verre vient du conteneur qui la porte ; ne jamais donner un fond `lg-N` à un item de liste individuellement, seulement à ses états d'interaction (voir §4).

## 1. Structure commune

| Propriété | Valeur |
|---|---|
| Espacement entre éléments | 0 (séparateur `border-color: var(--border)`) pour listes denses ; 8px entre cartes-éléments pour listes espacées |
| Hauteur min. d'un élément | 40px (simple) / 56px (avatar/image) / 72px (description + métadonnées) |
| Padding horizontal | 16px |
| Padding vertical | 12px (8px si dense) |
| Séparateurs | `var(--border)`, retirés entre dernier élément et conteneur |

## 2. Variantes de contenu

| Variante | Élément additionnel |
|---|---|
| Simple | texte seul |
| Icône | lucide 20px à gauche, `currentColor` ou couleur sémantique |
| Avatar | `Avatar` (shadcn), cercle `rounded-full`, 32px (dense) / 40px (standard) |
| Image | vignette `radius-md`, 48×48px |
| Description | `text-sm`, `text-muted-foreground`, sous le libellé, tronqué 2 lignes |
| Métadonnées | texte/`Badge` aligné à droite |
| Case à cocher | `Checkbox`, à gauche, avant icône/avatar |
| Bouton d'action | icône seule, révélée au survol (desktop) ou toujours visible (mobile) |
| Menu contextuel | icône "…" à droite, ouvre `dropdown-menu-content` (voir [menus.md](menus.md)) |
| Glisser-déposer | poignée `⋮⋮`, curseur `grab`/`grabbing` |

## 3. Listes spécialisées

- **Notifications** : pastille non-lu `var(--primary)` 8px à gauche, horodatage relatif à droite, fond `var(--lg-1-bg)` si non lue
- **Fichiers** : icône colorée par type de fichier, taille + date en métadonnées
- **Utilisateurs** : avatar + nom + rôle en description, statut en ligne = pastille `var(--success)`/neutre sur l'avatar
- **Résultats de recherche** : terme surligné en `font-semibold`, pas de fond coloré
- **Navigation** : pas de séparateurs, item actif = fond `var(--lg-1-bg)` + liseré gauche 3px `var(--primary)` — pattern déjà visible dans la sidebar réelle (`sidebar-accent`)
- **Paramètres** : libellé + description + contrôle (`Switch`/`Select`) aligné à droite

## 4. États

| État | Rendu |
|---|---|
| Normal | fond transparent |
| Survol | `background: var(--lg-1-bg)` |
| Actif (clic) | `var(--lg-1-bg)` plus opaque |
| Sélectionné | `color-mix(in oklch, transparent, var(--primary) 10%)` + liseré gauche 3px `var(--primary)` |
| Désactivé | `opacity-45`, `cursor: not-allowed` |
| Chargement | 3-5 items en `Skeleton` |
| Vide | icône + texte centré, voir [global-states.md](global-states.md) |
| Erreur | icône `var(--destructive)` + message inline, "Réessayer" |

## 5. Mobile

Padding horizontal 20px (zone tactile), bouton d'action toujours visible, glisser-déposer remplacé par boutons "monter/descendre" ou long-press.

## 6. Animation ajout/suppression

Ajout : fondu + hauteur `0→auto` + translation `-8px→0`, ~200ms. Suppression : inverse, ~120ms, les éléments suivants remontent en douceur.
