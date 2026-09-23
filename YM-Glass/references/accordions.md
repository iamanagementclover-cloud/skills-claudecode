# YM-Glass — Accordéons et éléments dépliables

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

**Il n'existe pas encore de composant `accordion.tsx` dans `src/components/ui`.** Cette spec dérive des mêmes tokens que le reste du produit pour que le composant, le jour où il est ajouté (`npx shadcn add accordion`), s'intègre sans dissonance — même logique que le reste du design system : `lg-1` au survol/ouvert, rayons dérivés de `--radius`, focus = `--ring`.

**Règle par défaut : tous les éléments accordéon sont fermés à l'ouverture de la page**, sauf si le contexte le justifie (unique résultat de recherche, FAQ ciblée par URL).

## 1. En-tête (bouton déclencheur)

| Propriété | Valeur |
|---|---|
| Hauteur min | 48px |
| Padding | 16px horizontal, 12px vertical |
| Titre | `text-sm`, `font-medium`, `text-foreground` |
| Description (optionnelle) | `text-sm`, `text-muted-foreground`, sous le titre |
| Icône | `ChevronDown` lucide 16px, alignée à droite |
| Curseur | `pointer` sur toute la largeur de l'en-tête |

## 2. Icône d'état

- **Fermé** : chevron vers le bas
- **Ouvert** : rotation 180° animée (~200ms), pas de morph croisé
- Position : toujours à droite, sauf accordéon de navigation dense (icône à gauche, alignée avec les autres icônes de la liste)

## 3. États de l'en-tête

| État | Rendu |
|---|---|
| Fermé | fond transparent |
| Ouvert | `background: var(--lg-1-bg)` léger |
| Survol | `background: var(--lg-1-bg)` |
| Focus clavier | `outline: 2px solid var(--ring)` |
| Désactivé | `opacity-45`, icône masquée |

## 4. Contenu interne

- Padding : 16px horizontal, 12px haut / 16px bas
- Bordures : en liste → séparateur `var(--border)` entre items, pas de bordure autour du contenu déplié ; isolé (carte) → bordure complète `var(--radius-lg)`
- Peut contenir n'importe quel composant YM-Glass (liste, formulaire…)

## 5. Animation

- **Ouverture** : hauteur `0 → auto` (`grid-template-rows: 0fr → 1fr` ou mesure `scrollHeight`) + fondu du contenu, ~200ms
- **Fermeture** : inverse, ~120ms
- Jamais de `display:none` brutal, jamais de saut du contenu situé sous l'accordéon au-delà de sa hauteur réelle

## 6. Comportement multi-accordéons

| Mode | Comportement |
|---|---|
| Exclusif | ouvrir un item ferme les autres — FAQ, panneaux de réglages |
| Indépendant | chaque item indépendant — sections de contenu, filtres |

Ne jamais mélanger les deux logiques dans un même groupe.

## 7. Mobile

Pas de changement structurel — tap au lieu de clic, zone tactile de l'en-tête garantie à 48px minimum.
