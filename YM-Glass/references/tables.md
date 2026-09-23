# YM-Glass — Tableaux

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

`table.tsx` (shadcn) n'a pas de câblage `data-slot` dédié dans `globals.css` — dans le produit réel, un tableau est presque toujours posé **à l'intérieur** d'une `Card` (`lg-2`), qui porte le verre ; le tableau lui-même reste transparent pour ne pas empiler un second blur inutilement. Ne jamais mettre le tableau lui-même en `lg-N` s'il est déjà dans une carte.

## 1. Conteneur

| Propriété | Valeur |
|---|---|
| Fond | transparent si dans une `Card` `lg-2` ; sinon `lg-2` directement pour un tableau plein écran/autonome |
| Rayon | `var(--radius-xl)` hérité de la carte parente |
| Overflow | `overflow-x: auto` sous 1024px, scrollbar discrète |

## 2. En-tête

- Fond légèrement voilé (`background: var(--lg-1-bg)` en superposition), sticky au scroll vertical
- Texte : `text-xs`, `font-semibold`, `uppercase`, `text-muted-foreground`, `tracking-wide`
- Hauteur : 44px
- Icône de tri (`ChevronsUpDown` lucide) apparaît au survol de colonne triable, pleine opacité + orientée si active

## 3. Colonnes et cellules

| Propriété | Valeur |
|---|---|
| Padding cellule | 12px vertical, 16px horizontal |
| Alignement | texte à gauche, montants à droite avec `.tabular-nums` (essentiel — le projet gère MGA/EUR, les colonnes de montants doivent aligner leurs chiffres), statuts/actions centrés |
| Troncature | `text-overflow: ellipsis` + `title` natif |

## 4. Lignes

- Séparateur : `border-color: var(--border)`, 1px horizontal uniquement
- Lignes alternées (optionnel, tableaux denses) : `background: var(--lg-1-bg)` à 50% sur les lignes paires

## 5. Tri, filtres, recherche

- **Tri** : clic sur en-tête, cycle asc → desc → aucun
- **Filtres** : badge actif retirable au-dessus du tableau (voir [notifications.md](notifications.md) §badge)
- **Recherche** : champ `lg-2` (même niveau que `[data-slot="input"]`) au-dessus, debounce 250ms

## 6. Sélection

- Case à cocher première colonne
- Ligne sélectionnée : `background: color-mix(in oklch, transparent, var(--primary) 8%)`
- Case "tout sélectionner" en en-tête, état indéterminé si sélection partielle

## 7. Actions

- **Par ligne** : icônes révélées au survol (desktop) ou toujours visibles (mobile), menu "…" (`dropdown-menu-content`, `lg-3`) si > 2 actions
- **Groupées** : barre d'action contextuelle au-dessus du tableau dès ≥1 ligne sélectionnée, remplace temporairement le titre de section, ~200ms

## 8. Pagination

- Alignée à droite (desktop) / centrée (mobile)
- "X–Y sur Z résultats" à gauche, contrôles à droite
- Page active : fond `var(--primary)`, texte `var(--primary-foreground)`

## 9. États

| État | Rendu |
|---|---|
| Ligne normale | fond transparent (ou alterné, §4) |
| Survol | `background: var(--lg-1-bg)` |
| Sélectionnée | §6 |
| Désactivée | `opacity-45` |
| Chargement | `Skeleton` — lignes grisées, animation `shimmer-sweep` (voir [global-states.md](global-states.md)) |
| Erreur | icône + message centré, "Réessayer" |
| Statut | `Badge` coloré (voir [notifications.md](notifications.md) §badge) |
| Vide | icône + texte + action optionnelle, centrés |

## 10. Mobile

Sous 768px : scroll horizontal avec première colonne fixée (`position: sticky; left: 0`), ou transformation en cartes (`lg-2` chacune) si > 5 colonnes — voir [cards.md](cards.md).
