# YM-Glass — Design Tokens

[← Retour à SKILL.md](../SKILL.md)

**Ce ne sont pas des tokens inventés.** Ce fichier documente le système "Liquid Glass" qui existe déjà, en production, dans le projet Litchi (`src/app/globals.css`, lignes 60–207 et 320–519). Le rôle de ce skill n'est pas de proposer une direction visuelle — c'est de **répliquer exactement** celle-ci partout où un composant est spécifié ou codé. Si un composant qu'on te demande de spécifier n'existe pas encore dans `globals.css`, dérive-le des mêmes variables ; n'introduis jamais une couleur, un rayon ou une ombre qui n'a pas de source dans ce fichier.

Miroir CSS prêt à l'emploi : [assets/glass-tokens.css](../assets/glass-tokens.css). En cas de doute, le fichier projet fait foi — resynchronise ce miroir si `globals.css` évolue.

## 1. Couleur de marque

| Rôle | Valeur (clair et sombre — identique) | Notes |
|---|---|---|
| `--primary` | `oklch(0.875 0.238 150.6)` | vert vif saturé — **couleur de marque Litchi**, pas de bleu nulle part dans le système |
| `--primary-glow` | `oklch(0.92 0.2 150.6)` | halo radial derrière les héros marketing (`.bg-radial-fade`) |
| `--primary-foreground` | `oklch(0.21 0.033 127.3)` | texte **sombre** sur fond primary — primary est clair, jamais de texte blanc dessus |
| `--accent` | `#f8015a` | magenta — accent ponctuel (CTA rare, highlight), jamais utilisé comme fond de grande surface |
| `--accent-foreground` | `#ffffff` | texte blanc sur accent |
| `--ring` | = `--primary` | l'anneau de focus est la couleur de marque, pas un token de focus séparé |

`::selection` du site = `bg-primary/25`. Le logo (fruit facetté rouge→rose→magenta sur fond noir) confirme cette identité : vert de marque pour l'action, magenta pour l'accent rare — ne jamais utiliser de bleu comme couleur d'accent.

## 2. Couleurs sémantiques (alertes/statuts)

| Rôle | Clair | Sombre |
|---|---|---|
| `--destructive` | `oklch(0.6 0.22 22)` | `oklch(0.68 0.2 22)` |
| `--success` | `oklch(0.65 0.15 155)` | `oklch(0.72 0.16 155)` |
| `--warning` | `oklch(0.78 0.15 75)` | `oklch(0.8 0.15 75)` |

**Il n'existe pas de rôle "info" dédié.** Pour une alerte informative neutre, réutilise `--primary` (ton de marque) ou une simple bordure `--border` + texte `--foreground` — n'invente pas un bleu "info", ce serait la première incohérence avec le reste du produit.

Chaque rôle sémantique a un `-foreground` assorti (`--success-foreground`, `--warning-foreground`) pour le texte/icône posé dessus — toujours l'utiliser plutôt que déduire un noir/blanc à l'œil.

## 3. Neutres et surfaces pleines (non-glass)

| Token | Clair | Sombre |
|---|---|---|
| `--background` | `oklch(0.995 0.002 260)` | `oklch(0.15 0.018 265)` |
| `--foreground` | `oklch(0.16 0.02 265)` | `oklch(0.96 0.006 260)` |
| `--card` | `oklch(1 0 0)` | `oklch(0.19 0.02 265)` |
| `--popover` | `oklch(1 0 0)` | `oklch(0.185 0.02 265)` |
| `--secondary` / `--muted` | `oklch(0.96 0.008 265)` | `oklch(0.25 0.02 265)` / `oklch(0.24 0.018 265)` |
| `--muted-foreground` | `oklch(0.5 0.02 265)` | `oklch(0.66 0.02 265)` |
| `--border` / `--input` | `oklch(0.91 0.01 265)` | `oklch(1 0 0 / 8%)` / `oklch(1 0 0 / 12%)` |

Ces tokens `--card`/`--popover`/etc. sont les valeurs **shadcn opaques** — elles ne sont quasiment jamais peintes telles quelles à l'écran, car chaque primitive shadcn est déjà re-câblée sur une surface glass (§7). Elles restent le fallback si `backdrop-filter` n'est pas supporté.

## 4. Rayons

Une seule variable de base, tout le reste en dérive par `calc()` — ne jamais écrire un rayon en dur.

| Token | Formule | Valeur |
|---|---|---|
| `--radius` | — | `0.75rem` (12px), base |
| `--radius-sm` | `calc(var(--radius) * 0.5)` | 6px |
| `--radius-md` | `calc(var(--radius) * 0.75)` | 9px |
| `--radius-lg` | `var(--radius)` | 12px |
| `--radius-xl` | `calc(var(--radius) * 1.35)` | 16.2px |
| `--radius-2xl` | `calc(var(--radius) * 1.75)` | 21px |
| `--radius-3xl` | `calc(var(--radius) * 2.2)` | 26.4px |
| `--radius-4xl` | `calc(var(--radius) * 2.6)` | 31.2px |

Pastilles/avatars pleinement ronds : `border-radius: 9999px` (pas un token dédié, convention Tailwind `rounded-full`).

## 5. Le système Liquid Glass — 4 niveaux

C'est le cœur du design system. Chaque niveau combine **fond translucide + flou + saturation + bordure dégradée + ombre double teintée**. Le flou seul ne suffit jamais — sans `saturate()`, le verre paraît terne ; c'est l'ingrédient que la plupart des imitations de glassmorphism oublient.

| Niveau | Opacité fond (clair) | Opacité fond (sombre) | Blur | Saturate | Usage réel dans le produit |
|---|---|---|---|---|---|
| `lg-1` | 10% | 6% | 8px | 180% | sidebar (`sidebar-inner`), liste de navigation, `tabs-list` |
| `lg-2` | 16% | 9% | 8px | 190% | carte (`[data-slot="card"]`), input, textarea |
| `lg-3` | 24% | 13% | 16px | 200% | popover, menu déroulant, select, onglet actif |
| `lg-4` | 38% | 18% | 14px | 210% | modale (`dialog-content`, `sheet-content`) — le niveau le plus opaque, réservé au premier plan |

Fond : `rgba(210, 214, 220, opacité)` en clair, `rgba(255, 255, 255, opacité)` en sombre — jamais une teinte colorée, le fond glass reste neutre pour laisser la couleur venir du contenu et de l'accent de bordure.

```css
.lg-2 {
  background: var(--lg-2-bg);
  backdrop-filter: blur(var(--lg-2-blur)) saturate(var(--lg-2-sat));
  border: 1px solid var(--lg-2-border);
  box-shadow: var(--lg-2-shadow);
}
```

### Bordure

Pas une couleur fixe : `color-mix(in oklch, var(--lg-border-contrast) X%, rgba(blanc, Y))` — un mélange entre un gris-ardoise de contraste (`rgba(100,116,139,.35)` clair / `rgba(255,255,255,.16)` sombre) et du blanc translucide. Le pourcentage de contraste **diminue** du niveau 1 au niveau 4 (55%→40%) : plus la surface est haute/opaque, moins sa bordure a besoin de contraste pour rester lisible.

### Ombre — toujours triple

Chaque `--lg-N-shadow` empile 3 couches, jamais une seule :
1. ombre portée vers le bas, teintée `rgba(28,36,48,X)` en clair (**jamais noir pur** — le bleu-navy de la teinte est ce qui rend l'ombre "habitée" plutôt que plate) ou `rgba(0,0,0,X)` en sombre
2. highlight interne 1px en haut (`inset 0 1px 1px rgba(255,255,255,Y)`) — reflet du haut du verre
3. ombre interne douce en bas (`inset 0 -Npx Mpx -Kpx rgba(...)`) — assombrit légèrement le bas de la surface, accentue la courbure perçue

### Halo spéculaire (bord supérieur)

En plus de la bordure, chaque surface `.lg-N` porte un pseudo-élément `::before` qui peint un **anneau dégradé de 1px** (blanc 90% en haut → transparent à 30% de hauteur), via `mask-composite: exclude` pour ne peindre que l'anneau, jamais l'intérieur. C'est ce détail qui donne l'impression d'un bord de verre biseauté plutôt qu'une simple bordure plate. Voir implémentation dans [assets/glass-tokens.css](../assets/glass-tokens.css).

## 6. Verre teinté (marque / destructif)

Pour un bouton primaire ou une action destructive **en style glass** (pas un bouton plein), le fond glass se teinte via `color-mix` plutôt que de changer de niveau :

| Token | Formule |
|---|---|
| `--lg-primary-bg` | `color-mix(in oklch, var(--lg-3-bg), var(--primary) 14%)` |
| `--lg-primary-bg-hover` | même formule, `24%` |
| `--lg-primary-border` | `color-mix(in oklch, var(--primary) 45%, var(--lg-border-contrast))` |
| `--lg-destructive-bg` | `color-mix(in oklch, var(--lg-2-bg), var(--destructive) 16%)` |
| `--lg-destructive-bg-hover` | même formule, `28%` |

## 7. Wiring shadcn — quel composant utilise quel niveau

Le projet re-cible les primitives shadcn générées (attribut `data-slot`) directement en CSS globale plutôt que de passer des props de style composant par composant :

| Sélecteur | Niveau glass |
|---|---|
| `[data-slot="card"]`, `.bg-card` | `lg-2` |
| `[data-slot="input"]`, `[data-slot="textarea"]` | `lg-2` |
| `[data-slot="sidebar-inner"]`, `[data-slot="tabs-list"][data-variant="default"]` | `lg-1` |
| `[data-slot="popover-content"]`, `[data-slot="dropdown-menu-content"]`, `[data-slot="select-content"]` | `lg-3` |
| `[data-slot="dialog-content"]`, `[data-slot="sheet-content"]` | `lg-4` |
| `[data-slot="dialog-overlay"]`, `[data-slot="sheet-overlay"]` | `background: var(--lg-scrim); backdrop-filter: blur(6px)` (pas un niveau lg-N — l'overlay est un cas à part) |

**Reproduis ce même principe pour tout nouveau composant** : cible le `data-slot` (ou une classe équivalente) en CSS globale, n'ajoute pas de style glass inline composant par composant — c'est ce qui garde tout le produit cohérent avec un seul point de vérité.

## 8. Fond applicatif (canvas)

- `html { background: var(--lg-canvas-c); }` — couleur de secours avant chargement de l'image
- `.lg-canvas` : `position: fixed; inset: 0; z-index: 0` + image plein viewport (`background-size: cover`), `pointer-events: none`
- Images réelles : [assets/bg-canvas-light.webp](../assets/bg-canvas-light.webp) / [assets/bg-canvas-dark.webp](../assets/bg-canvas-dark.webp) (servies depuis `/public/bg-canvas-light.webp` et `/public/bg-canvas-dark.webp` dans le projet)
- 4 teintes d'accent de canvas disponibles pour des blobs/dégradés décoratifs, différentes par thème :

| Token | Clair | Sombre |
|---|---|---|
| `--lg-canvas-a` | `#f6ecd8` crème chaud | `#4a3a1f` |
| `--lg-canvas-b` | `#d3e9e6` teal d'eau | `#17403d` |
| `--lg-canvas-c` | `#d2d6dc` gris | `#101216` |
| `--lg-canvas-d` | `#e3d9f5` mauve | `#33285a` |

Toutes les surfaces `.lg-N` reposent sur ce fond — ne jamais évaluer le rendu d'un composant glass sur un fond blanc/noir uni, la calibration d'opacité suppose ce canvas texturé dessous.

## 9. Typographie

- **Corps / UI** : `Geist` (`--font-sans`, appliqué globalement via `font-sans` sur `<html>`)
- **Chiffres alignés en colonne** : `Plus Jakarta Sans` (lié historiquement à la variable `--font-geist-mono`) — utiliser `.tabular-nums` (`font-variant-numeric: tabular-nums`) partout où des montants/nombres s'alignent verticalement (tableaux, stats)
- **Display / titres marketing** : `Instrument Serif` via la classe utilitaire `.font-display` — réservé aux gros titres de landing page, jamais à l'UI d'application (dashboard)
- **Échelle** : échelle Tailwind standard, pas de token custom — `text-xs` 12px, `text-sm` 14px, `text-base` 16px, `text-lg` 18px, `text-xl` 20px, `text-2xl` 24px, `text-3xl` 30px, `text-5xl`/`text-6xl` pour les héros marketing uniquement

## 10. Rayons de secours pour ombre "plate" (hors glass)

Pour une élévation sur une surface **non-glass** (au-dessus du canvas mais sans flou, rare — ex. un menu contextuel imprimé), utilitaire `.shadow-elevated` : triple ombre neutre basée sur `color-mix(in oklch, var(--foreground) N%, transparent)`, jamais sur du noir en dur — reste cohérente en sombre automatiquement.

## 11. Animation et mouvement

Pas d'échelle de durée custom documentée dans `globals.css` au-delà des animations nommées (`marquee` 32s, `float` 6s, `logo-glow` 5s, `shimmer-sweep` 3.5s — toutes marketing/décoratives). Pour les transitions d'interface (ouverture menu, modale, hover), utiliser les durées Tailwind par défaut (`duration-150`/`200`) avec un easing standard — rien à réinventer ici, mais rester cohérent : jamais de rebond sur un composant fonctionnel.

`prefers-reduced-motion: reduce` est déjà géré globalement (toutes animations et transitions ramenées à `0.01ms`) — ne pas dupliquer cette règle localement, elle s'applique déjà à tout nouveau composant.

## 12. Icônes

Bibliothèque : `lucide` (`iconLibrary` dans `components.json`), trait fin, hérite `currentColor`. Cas particulier : dans le shell dashboard (`body[data-app-shell="dashboard"]`), les icônes qui porteraient `text-primary` sont recolorées en `--muted-foreground` — le vert de marque est réservé au site public, pas au dashboard applicatif. Ne pas appliquer `text-primary` à une icône de dashboard en s'attendant à la voir verte.
