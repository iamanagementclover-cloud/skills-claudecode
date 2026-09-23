# YM-Glass — Menus et éléments déroulants

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

Dans le vrai produit : `[data-slot="popover-content"]`, `[data-slot="dropdown-menu-content"]`, `[data-slot="dropdown-menu-sub-content"]`, `[data-slot="select-content"]` (`src/app/globals.css:412-420`) — tous sur le **même niveau de verre**, `lg-3`. Couvre menu déroulant, select, combobox, menu contextuel, menu utilisateur, menu d'actions, menu de navigation, sous-menu, filtre déroulant, sélecteur de période/d'espace de travail : ce sont tous des variantes de contenu du même conteneur `lg-3`.

## 1. Conteneur commun

```css
[data-slot="popover-content"],
[data-slot="dropdown-menu-content"],
[data-slot="dropdown-menu-sub-content"],
[data-slot="select-content"] {
  background: var(--lg-3-bg);
  backdrop-filter: blur(var(--lg-3-blur)) saturate(var(--lg-3-sat));
  border: 1px solid var(--lg-3-border);
  box-shadow: var(--lg-3-shadow);
}
```

| Propriété | Valeur |
|---|---|
| Fond | `rgba(210,214,220,.24)` clair / `rgba(255,255,255,.13)` sombre |
| Blur + saturate | `16px` + `200%` (clair) — le niveau le plus saturé après la modale, pour rester lisible malgré la petite taille |
| Bordure | `var(--lg-3-border)` — `color-mix(in oklch, var(--lg-border-contrast) 45%, rgba(blanc,.65))` |
| Ombre | `var(--lg-3-shadow)` — triple, teintée navy |
| Rayon | `var(--radius-lg)` (12px) |
| Padding interne | 8px autour de la liste d'items |
| Largeur min | égale à l'élément déclencheur |
| Largeur max | 320px, texte tronqué au-delà |

Le halo spéculaire (`::before`) s'applique ici aussi — un menu qui n'a que la bordure sans le highlight du bord haut paraît plat, pas en verre.

## 2. Groupes et séparateurs

- Étiquette de groupe : `text-xs`, `text-muted-foreground`, `uppercase`, `tracking-wide`, padding 8px
- Séparateur entre groupes : `border-color: var(--border)`, 1px, marge verticale 4px, jamais en tout début/fin de menu

## 3. Item de menu

| Propriété | Valeur |
|---|---|
| Hauteur min | 36px |
| Padding horizontal | 12px |
| Rayon au survol | `var(--radius-md)` (9px), appliqué à l'item, pas au conteneur |
| Texte | `text-sm`, `font-normal`, `text-foreground` |
| Texte secondaire (raccourci, valeur) | `text-xs`, `text-muted-foreground`, aligné à droite |
| Icône | lucide 16px, `currentColor`, à gauche, 8px avant le texte |

## 4. États de l'item

| État | Rendu |
|---|---|
| Normal | fond transparent |
| Survol / focus clavier (flèches) | fond `var(--lg-1-bg)` superposé (léger voile, pas un niveau glass complet — pas de nouveau blur, juste une teinte), `radius-md` |
| Sélectionné (select/combobox) | icône check à droite (`var(--primary)`) + texte `font-medium` |
| Désactivé | `opacity-40`, `cursor: not-allowed` |
| Destructif | texte + icône `var(--destructive)`, survol = fond `var(--lg-destructive-bg)` |

## 5. Variantes spécifiques

- **Select** : déclencheur = champ `lg-2` (même niveau que les inputs) avec chevron à droite ; menu `select-content` = largeur égale au champ
- **Combobox** (`Command` dans le projet) : champ de recherche fixe en haut, fond **transparent** — `[data-slot="command"] { background: transparent }` quand il est imbriqué dans un `CommandDialog`, car le parent (`dialog-content`, niveau `lg-4`) porte déjà le verre ; ne jamais empiler deux niveaux de blur sur la même zone
- **Menu contextuel** : `dropdown-menu-content`, ouvert au clic droit ou bouton "…", positionné au point de clic
- **Menu utilisateur** : en-tête non cliquable avec avatar + nom + email (`text-muted-foreground`) avant les items d'action, dans le même `dropdown-menu-content`
- **Sous-menu** : `dropdown-menu-sub-content`, même style `lg-3`, décalé horizontalement, léger délai d'ouverture au survol
- **Filtre déroulant** : items avec case à cocher, footer sticky "Réinitialiser"/"Appliquer" si sélection multiple
- **Sélecteur de période** : raccourcis en haut (Aujourd'hui, 7 derniers jours…), calendrier en dessous si "Personnalisé"
- **Sélecteur d'espace de travail** : items avec avatar carré (`radius-md`) + nom + rôle, item "Créer un espace" séparé en bas

## 6. Animation

- **Ouverture** : fondu + scale `.96→1` depuis le point d'ancrage, ~150ms
- **Fermeture** : fondu seul, ~120ms
- Sous-menu : léger délai (~100ms) pour éviter les ouvertures accidentelles

## 7. Positionnement responsive

- Desktop : positionné par rapport au déclencheur, flip automatique si débordement viewport
- Mobile (< 768px) : menus longs (select, combobox, filtre) basculent en `Sheet` (même composant que les modales plein écran, niveau `lg-4`) ; menus courts (≤ 4 items) restent en popover ancré, niveau `lg-3` inchangé
