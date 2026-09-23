---
name: YM-Glass
description: Design system "Liquid Glass" RÉEL du projet Litchi (SaaS + site web) — pas une proposition, une réplique exacte du système déjà en production dans src/app/globals.css (vert de marque oklch(0.875 0.238 150.6), accent magenta #f8015a, 4 niveaux de verre lg-1..lg-4 avec blur+saturate, fonds bg-canvas-*.webp) appliquée à modales, listes, accordéons, menus, tableaux, cartes, notifications et états globaux, en thème clair et sombre. Utilise ce skill dès que l'utilisateur mentionne "YM-Glass", "liquid glass", demande de créer/documenter/spécifier un composant d'interface Litchi, un style "glass"/"verre"/glassmorphism, ou de générer du CSS/HTML pour un élément visuel du produit — même sans citer le nom du skill. Ne jamais inventer une palette ou un jeu de tokens parallèle : ce skill sert à répliquer l'existant, pas à en proposer un nouveau.
---

# YM-Glass

Réplique documentée du design system "Liquid Glass" **déjà en production** dans le projet Litchi — pas une proposition, pas une palette inventée. Toutes les valeurs de ce skill viennent de `src/app/globals.css` (le fichier fait foi ; ce skill en est la doc + le miroir portable).

Deux usages, souvent combinés :

1. **Spécifier** un composant — décrire sa structure, ses valeurs clair/sombre, dimensions, espacements, typographie, bordures, rayons, ombres, icônes, états, animations, comportement responsive/clavier — en réutilisant exactement les tokens `--lg-*`/`--primary`/`--radius-*` existants.
2. **Générer le code** — écrire le CSS/HTML/TSX qui implémente cette spec en consommant les variables déjà définies dans `globals.css` (ou le miroir [assets/glass-tokens.css](assets/glass-tokens.css) hors du projet), jamais en redéfinissant une couleur/ombre/rayon en dur.

Aucun composant visuel du projet ne doit être laissé sans spec, même sans logique métier (un séparateur ou un skeleton loading comptent autant qu'un formulaire de paiement).

## La règle qui prime sur tout le reste

**Ce skill n'a pas le droit d'inventer.** La première version de ce skill avait fabriqué une palette bleue (`#3D6DFF`) et un jeu de variables `--ym-*` parallèle qui n'existaient nulle part dans le vrai produit — résultat : rien ne correspondait à l'esprit réel de Litchi. La correction : toute valeur utilisée ici doit être traçable jusqu'à une ligne précise de `src/app/globals.css`. Si une valeur semble manquante pour un nouveau composant, dérive-la des tokens existants (ex. un nouveau badge sémantique réutilise `--success`/`--warning`/`--destructive`, jamais une couleur ad hoc) plutôt que d'en inventer une.

Repères qui trahissent un écart avec l'esprit réel du produit — à vérifier systématiquement :
- Couleur de marque = **vert vif** `oklch(0.875 0.238 150.6)`, pas de bleu. Accent = **magenta** `#f8015a`, utilisé avec parcimonie.
- Le verre combine **toujours** `backdrop-filter: blur() saturate()` — le blur seul sans saturate rend un verre terne, ce n'est pas le rendu réel.
- Les ombres sont teintées navy `rgba(28,36,48,X)` en clair (jamais noir pur) et triples (portée + highlight haut + ombre interne basse).
- 4 niveaux de verre (`lg-1` à `lg-4`), chacun mappé à un usage précis du produit (sidebar = 1, carte/input = 2, popover/menu = 3, modale = 4) — ne pas les utiliser au hasard.
- Rayons dérivés d'une seule base (`--radius: .75rem`) par `calc()`, jamais une valeur en dur.

## Workflow

1. **Charger les tokens** — lire [references/design-tokens.md](references/design-tokens.md), qui documente ligne par ligne d'où vient chaque valeur dans `globals.css`. Étape jamais optionnelle.
2. **Identifier le(s) composant(s) concerné(s)** et ouvrir le(s) fichier(s) de référence correspondant(s) (table ci-dessous).
3. **Produire la spec et/ou le code** :
   - Spec seule → suivre le gabarit du fichier de référence, compléter les tableaux existants ou en ajouter un nouveau si le composant n'a pas encore d'entrée — toujours en citant le token réel utilisé (`var(--lg-2-bg)`, pas "un gris translucide").
   - Code dans le projet Litchi → consommer directement les variables de `src/app/globals.css`, cibler les primitives shadcn par `[data-slot="..."]` comme le fait déjà le fichier (voir [design-tokens.md](references/design-tokens.md) §7), ne pas dupliquer les définitions de variables.
   - Code hors du projet (maquette, prototype) → partir de [assets/glass-tokens.css](assets/glass-tokens.css), qui mirrore exactement les mêmes variables, et des fonds [assets/bg-canvas-light.webp](assets/bg-canvas-light.webp) / [assets/bg-canvas-dark.webp](assets/bg-canvas-dark.webp).
4. **Vérifier la cohérence** avant de livrer — voir checklist ci-dessous.
5. Nouveauté notable (nouvelle variante documentée) → envisager une mise à jour du README/index du projet si un tel index existe (convention markdown-docs : catégories best-practice / implementation / reports / tips / changelog, liens relatifs, tableau comparatif tenu à jour).

## Fichiers de référence par catégorie de composant

| Catégorie | Fichier | Composants couverts |
|---|---|---|
| Tokens de base | [references/design-tokens.md](references/design-tokens.md) | palette réelle, 4 niveaux `lg-1..4`, rayons dérivés, ombres triples, halo spéculaire, wiring `data-slot`, fonds canvas, typographie |
| Boîtes de dialogue | [references/dialogs.md](references/dialogs.md) | modale standard/confirmation/info/avertissement/suppression/formulaire/contenu long/multi-étapes/plein écran/chargement/erreur/succès |
| Listes | [references/lists.md](references/lists.md) | simple, icône, avatar, image, description, métadonnées, sélectionnable, case à cocher, action, menu contextuel, drag & drop, notifications, fichiers, utilisateurs, résultats de recherche, navigation, paramètres |
| Accordéons | [references/accordions.md](references/accordions.md) | éléments dépliables, mode exclusif/indépendant |
| Menus déroulants | [references/menus.md](references/menus.md) | menu déroulant, select, combobox, menu contextuel/utilisateur/actions/navigation, sous-menu, filtre, sélecteur de période/d'espace de travail |
| Tableaux | [references/tables.md](references/tables.md) | conteneur, tri, filtres, recherche, sélection, actions par ligne/groupées, pagination, responsive |
| Cartes et conteneurs | [references/cards.md](references/cards.md) | carte standard/interactive/statistique/graphique/badge/imbriquée, panneau latéral, conteneur de formulaire |
| Notifications et feedback | [references/notifications.md](references/notifications.md) | toast, alerte, bannière, badge, tooltip, notification système, progression, chargement |
| États visuels globaux | [references/global-states.md](references/global-states.md) | chargement, skeleton, vide, erreur, 404, 403, session expirée, hors ligne, maintenance |

## Checklist de cohérence

Avant de livrer une spec ou du code, vérifie que le composant :

- [ ] utilise un des 4 niveaux `lg-1`/`lg-2`/`lg-3`/`lg-4` correspondant à son usage réel (jamais un niveau choisi au hasard)
- [ ] combine `backdrop-filter: blur() saturate()` — jamais blur seul
- [ ] utilise l'échelle de rayons dérivée de `--radius` (jamais une valeur en dur)
- [ ] utilise une ombre triple teintée (portée navy/noir + highlight haut + ombre interne basse), pas une ombre grise générique
- [ ] utilise `--primary` (vert) pour la marque et `--accent` (magenta) seulement en accent ponctuel — jamais de bleu
- [ ] utilise `--destructive`/`--success`/`--warning` pour le sémantique, sans inventer de rôle "info" séparé
- [ ] a une valeur définie pour le thème clair **et** le thème sombre — jamais une seule
- [ ] a un anneau de focus = `--ring` (= `--primary`)
- [ ] a un comportement responsive documenté s'il change de forme sous `768px`
- [ ] a été comparé à `src/app/globals.css` pour éviter un style isolé incohérent avec le reste du produit

## Assets

- [assets/glass-tokens.css](assets/glass-tokens.css) — miroir exact des variables de `src/app/globals.css` (clair + sombre) + classes `.lg-1`…`.lg-4` + halo spéculaire, pour prototyper hors du projet
- [assets/bg-canvas-light.webp](assets/bg-canvas-light.webp) — vrai fond applicatif thème clair (`/public/bg-canvas-light.webp` dans le projet)
- [assets/bg-canvas-dark.webp](assets/bg-canvas-dark.webp) — vrai fond applicatif thème sombre (`/public/bg-canvas-dark.webp` dans le projet)
