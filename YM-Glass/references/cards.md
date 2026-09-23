# YM-Glass — Cartes et conteneurs

[← Retour à SKILL.md](../SKILL.md) · tokens : [design-tokens.md](design-tokens.md)

Dans le vrai produit : `[data-slot="card"]` et toute div brute `.bg-card`/`.bg-card/60`/`.bg-card/40` (`src/app/globals.css:391-410`) — niveau `lg-2`.

## 1. Carte standard

```css
[data-slot="card"], .bg-card {
  background: var(--lg-2-bg);
  backdrop-filter: blur(var(--lg-2-blur)) saturate(var(--lg-2-sat));
  border: 1px solid var(--lg-2-border);
  box-shadow: var(--lg-2-shadow);
}
```

| Propriété | Valeur |
|---|---|
| Fond | `rgba(210,214,220,.16)` clair / `rgba(255,255,255,.09)` sombre |
| Blur + saturate | 8px + 190% |
| Rayon | `var(--radius-xl)` (16.2px) — shadcn `base-nova` utilise un rayon plus généreux que les menus pour les cartes |
| Padding | 20-24px (`p-5`/`p-6` Tailwind selon densité) |
| Variante atténuée | `.bg-card\/60`, `.bg-card\/40` → passent en `lg-1` (fond + blur plus légers), pas juste une opacité CSS réduite sur le même fond |

## 2. Variantes

| Variante | Différence par rapport au standard |
|---|---|
| Interactive | `cursor: pointer`, survol = ombre `lg-3-shadow` (emprunt au niveau supérieur, effet "se soulève"), translation `-2px`, ~150ms |
| Sélectionnée | bordure remplacée par `2px solid var(--primary)`, fond `color-mix(in oklch, var(--lg-2-bg), var(--primary) 8%)` |
| Avec image | image pleine largeur en haut, rayon uniquement sur les coins hauts (`var(--radius-xl) var(--radius-xl) 0 0`) |
| Statistique | grand chiffre (`text-3xl`, `font-semibold`, `.tabular-nums`) + libellé (`text-sm`, `text-muted-foreground`) + variation en `Badge` `--success`/`--destructive` |
| Avec graphique | `chart.tsx` (Recharts) en zone basse — couleurs de série = `--chart-1` à `--chart-5`, jamais une couleur hors palette |
| Avec badge | badge coin haut-droit, léger débord (`-top-2 -right-2`) pour effet "épinglé" |
| Avec menu d'actions | icône "…" coin haut-droit, ouvre `dropdown-menu-content` (voir [menus.md](menus.md)) |
| Imbriquée | carte enfant = `lg-1` (un niveau de transparence en moins que le parent `lg-2`, pour rester lisible sans empiler deux blurs équivalents), pas d'ombre propre |

## 3. Autres conteneurs

- **Section de contenu** : pas de fond glass, simple regroupement, titre `text-lg font-semibold`, `gap-6` entre sections
- **Panneau latéral (sidebar)** : `[data-slot="sidebar-inner"]` → `lg-1` (le niveau le plus discret — la sidebar est visible en permanence, un verre trop marqué fatiguerait l'œil), largeur fixe, bordure uniquement côté contenu. **Piège technique documenté dans le code réel** : ne jamais appliquer le glass à `[data-slot="sidebar"]` directement sur desktop — cet attribut est aussi porté par le wrapper non-positionné qui contient le vrai panneau `fixed` ; lui donner un `backdrop-filter` en ferait un nouveau bloc de positionnement et casserait le `position: fixed` de l'enfant. Cibler `sidebar-inner`, jamais `sidebar` en desktop.
- **Conteneur de formulaire** : `lg-2`, `var(--radius-xl)`, padding 24px, champs espacés de 16px

## 4. États

| État | Rendu |
|---|---|
| Normal | tel que défini par variante |
| Survol | uniquement si `interactive` — §2 |
| Focus (carte cliquable) | `outline: 2px solid var(--ring)` (= `--primary`, vert) |
| Actif (clic maintenu) | scale `.99` |
| Sélectionné | §2 |
| Désactivé | `opacity-45`, aucune interaction |
| Chargement | `Skeleton` (voir [global-states.md](global-states.md)) aux proportions de la carte finale |
| Vide | icône + texte centrés |
| Erreur | bordure `var(--destructive)` 1px + icône + message court |

## 5. Responsive

Grille : `auto-fill`/`auto-fit` `minmax(240px, 1fr)`, `gap-4`. Sous 640px, une seule colonne, padding externe réduit.
