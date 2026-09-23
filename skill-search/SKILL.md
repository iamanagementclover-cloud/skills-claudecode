---
name: skill-search
description: Recherche de skills par tâche. Retourne catégories matchées, top pick, liste secondaire avec commandes d'activation. Invoke avec /skill-search "description de ta tâche".
metadata:
  origin: custom
  author: Lemon project
---

# Skill Search

## When to Activate

- User dit `/skill-search` suivi d'une description de tâche
- User demande "quelle skill pour X ?"
- User demande "quelles skills seraient utiles pour X ?"
- User veut connaître les skills disponibles dans une catégorie

## How It Works

1. Analyser la tâche décrite par l'utilisateur
2. Identifier les catégories matchées (1 ou plusieurs)
3. Pour chaque catégorie matchée : retourner **1 top pick** + **liste secondaire**
4. Si tâche = pipeline logique → montrer la séquence recommandée
5. Chaque skill affichée : nom + 1 ligne fonction + commande activation

## Taxonomie complète — 18 catégories

### 1. FLUTTER / DART / MOBILE
Skills pour développement Flutter, Dart, iOS, Android.
- `dart-flutter-patterns` — Patterns Dart/Flutter prod-ready (null safety, BLoC, Riverpod, GoRouter, Dio) → `/dart-flutter-patterns`
- `flutter-dart-code-review` — Review code Flutter/Dart idiomatique → `/flutter-dart-code-review`
- `flutter-adaptive-ui` — UI adaptative multi-taille (mobile/tablet/desktop) → `/flutter-adaptive-ui`
- `flutter-animations` — Animations Flutter (curves, transitions, custom) → `/flutter-animations`
- `compose-multiplatform-patterns` — Kotlin Multiplatform / Compose patterns → `/compose-multiplatform-patterns`
- `android-clean-architecture` — Clean Architecture Android → `/android-clean-architecture`
- `ios-icon-gen` — Génération icônes iOS → `/ios-icon-gen`
- `swiftui-patterns` — Patterns SwiftUI → `/swiftui-patterns`
- `swift-concurrency-6-2` — Concurrence Swift 6.2 → `/swift-concurrency-6-2`
- `swift-actor-persistence` — Actors + persistence Swift → `/swift-actor-persistence`
- `swift-protocol-di-testing` — DI et tests via protocols Swift → `/swift-protocol-di-testing`
- `foundation-models-on-device` — LLM on-device (Core ML, MediaPipe) → `/foundation-models-on-device`
- `Lemon-Pro-D` — **Design system Lemon** (projet hotel_app uniquement) → `/Lemon-Pro-D`
- `sleek-design-mobile-apps` — Design épuré apps mobiles → `/sleek-design-mobile-apps`

### 2. FIREBASE
Skills pour tout ce qui touche Firebase.
- `firebase-basics` — Setup et init Firebase → `/firebase-basics`
- `firebase-firestore` — Firestore queries, rules, indexes, modèles → `/firebase-firestore`
- `firebase-auth-basics` — Auth Firebase (email, OAuth, custom claims) → `/firebase-auth-basics`
- `firebase-app-hosting-basics` — Deploy Firebase App Hosting → `/firebase-app-hosting-basics`
- `firebase-hosting-basics` — Deploy Firebase Hosting (web statique) → `/firebase-hosting-basics`
- `firebase-ai-logic-basics` — Logique IA avec Firebase (Vertex AI / Genkit) → `/firebase-ai-logic-basics`
- `firebase-data-connect` — Firebase Data Connect (SQL+GraphQL) → `/firebase-data-connect`
- `firebase-remote-config-basics` — Feature flags et A/B via Remote Config → `/firebase-remote-config-basics`
- `firebase-crashlytics` — Crash reporting mobile (Crashlytics) → `/firebase-crashlytics`
- `firebase-security-rules-auditor` — Audit règles Firestore/Storage → `/firebase-security-rules-auditor`

### 3. FRONTEND / WEB
Skills pour développement web frontend.
- `frontend-patterns` — Patterns frontend modernes → `/frontend-patterns`
- `frontend-a11y` — Accessibilité frontend (WCAG) → `/frontend-a11y`
- `frontend-design-direction` — Direction design frontend → `/frontend-design-direction`
- `accessibility` — WCAG 2.2 AA, ARIA, accessibilité native → `/accessibility`
- `react-patterns` — Patterns React modernes → `/react-patterns`
- `react-performance` — Optimisation performance React → `/react-performance`
- `react-testing` — Tests React (RTL, Vitest) → `/react-testing`
- `nextjs-turbopack` — Next.js avec Turbopack → `/nextjs-turbopack`
- `nuxt4-patterns` — Patterns Nuxt 4 → `/nuxt4-patterns`
- `vue-patterns` — Patterns Vue.js → `/vue-patterns`
- `ui-to-vue` — Migration UI vers Vue → `/ui-to-vue`
- `vite-patterns` — Config et patterns Vite → `/vite-patterns`
- `angular-developer` — Développement Angular → `/angular-developer`
- `web-artifacts-builder` — Composants/widgets web → `/web-artifacts-builder`
- `prototype` — Prototype rapide HTML/CSS/Flutter → `/prototype`

### 4. UI / UX / DESIGN VISUEL
Skills pour design d'interface et expérience utilisateur.
- `ui-ux-pro-max` — Design UI/UX haute qualité → `/ui-ux-pro-max`
- `ux-designer` — Conception UX (parcours, wireframes) → `/ux-designer`
- `design-an-interface` — Concevoir interface de zéro → `/design-an-interface`
- `design-taste-frontend` — Appliquer goût design au code existant → `/design-taste-frontend`
- `high-end-visual-design` — Design premium (glassmorphism, gradients) → `/high-end-visual-design`
- `design-system` — Construire un design system → `/design-system`
- `liquid-glass-design` — UI style liquid glass (Apple-like) → `/liquid-glass-design`
- `theme-factory` — Générer système de thèmes complet → `/theme-factory`
- `algorithmic-art` — Art génératif algorithmique → `/algorithmic-art`
- `redesign-existing-projects` — Refonte visuelle projets existants → `/redesign-existing-projects`
- `inherit-legacy-style` — Hériter et étendre style visuel legacy → `/inherit-legacy-style`
- `make-interfaces-feel-better` — Micro-améliorations feel d'interface → `/make-interfaces-feel-better`
- `taste` — Appliquer bon goût design général → `/taste`
- `canvas-design` — Design sur canvas → `/canvas-design`
- `motion-foundations` — Bases animation/motion design → `/motion-foundations`
- `motion-patterns` — Patterns motion UI → `/motion-patterns`
- `motion-advanced` — Animations avancées → `/motion-advanced`
- `motion-ui` — Motion design pour UI → `/motion-ui`
- `brand-guidelines` — Charte de marque complète → `/brand-guidelines`
- `brand-discovery` — Découverte identité de marque → `/brand-discovery`
- `brand-voice` — Ton et voix de marque → `/brand-voice`
- `ui-demo` — Démo composants UI → `/ui-demo`

### 5. BACKEND / SERVEURS / BDD
Skills pour backend, APIs, bases de données, frameworks serveur.
- `backend-patterns` — Patterns backend généraux → `/backend-patterns`
- `api-design` — Design d'API REST/GraphQL → `/api-design`
- `api-connector-builder` — Construire connecteurs API → `/api-connector-builder`
- `database-migrations` — Migrations DB (SQL/NoSQL) → `/database-migrations`
- `schema` — Design schéma DB/Firestore/JSON → `/schema`
- `postgres-patterns` — Patterns PostgreSQL → `/postgres-patterns`
- `mysql-patterns` — Patterns MySQL → `/mysql-patterns`
- `redis-patterns` — Patterns Redis → `/redis-patterns`
- `clickhouse-io` — ClickHouse patterns → `/clickhouse-io`
- `prisma-patterns` — Patterns Prisma ORM → `/prisma-patterns`
- `docker-patterns` — Containerisation Docker → `/docker-patterns`
- `deployment-patterns` — Patterns de déploiement → `/deployment-patterns`
- `kubernetes-patterns` — Patterns Kubernetes → `/kubernetes-patterns`
- `fastapi-patterns` — Patterns FastAPI (Python) → `/fastapi-patterns`
- `django-patterns` — Patterns Django → `/django-patterns`
- `django-celery` — Django + Celery tasks async → `/django-celery`
- `django-security` — Sécurité Django → `/django-security`
- `django-tdd` — TDD avec Django → `/django-tdd`
- `nestjs-patterns` — Patterns NestJS → `/nestjs-patterns`
- `springboot-patterns` — Patterns Spring Boot → `/springboot-patterns`
- `springboot-security` — Sécurité Spring Boot → `/springboot-security`
- `quarkus-patterns` — Patterns Quarkus → `/quarkus-patterns`
- `laravel-patterns` — Patterns Laravel → `/laravel-patterns`
- `laravel-security` — Sécurité Laravel → `/laravel-security`
- `hexagonal-architecture` — Architecture hexagonale → `/hexagonal-architecture`
- `error-handling` — Patterns gestion d'erreurs → `/error-handling`
- `jpa-patterns` — Patterns JPA/Hibernate → `/jpa-patterns`
- `bun-runtime` — Runtime Bun patterns → `/bun-runtime`

### 6. LANGAGES (patterns et tests)
Skills spécifiques à un langage.
- `golang-patterns` + `golang-testing` — Go → `/golang-patterns` `/golang-testing`
- `kotlin-patterns` + `kotlin-testing` — Kotlin → `/kotlin-patterns` `/kotlin-testing`
- `kotlin-coroutines-flows` — Coroutines et Flows Kotlin → `/kotlin-coroutines-flows`
- `kotlin-ktor-patterns` — Ktor (Kotlin server) → `/kotlin-ktor-patterns`
- `kotlin-exposed-patterns` — Exposed ORM Kotlin → `/kotlin-exposed-patterns`
- `rust-patterns` + `rust-testing` — Rust → `/rust-patterns` `/rust-testing`
- `python-patterns` + `python-testing` — Python → `/python-patterns` `/python-testing`
- `pytorch-patterns` — PyTorch ML → `/pytorch-patterns`
- `cpp-coding-standards` + `cpp-testing` — C++ → `/cpp-coding-standards` `/cpp-testing`
- `java-coding-standards` — Java → `/java-coding-standards`
- `csharp-testing` — C# tests → `/csharp-testing`
- `fsharp-testing` — F# tests → `/fsharp-testing`
- `perl-patterns` + `perl-testing` + `perl-security` — Perl → `/perl-patterns`
- `dotnet-patterns` — .NET patterns → `/dotnet-patterns`
- `tinystruct-patterns` — TinyStruct framework → `/tinystruct-patterns`

### 7. TESTS / QA / VALIDATION
Skills pour tester, valider, certifier.
- `tdd` — Test-Driven Development → `/tdd`
- `tdd-workflow` — Workflow TDD complet → `/tdd-workflow`
- `qa` — Quality assurance plan et edge cases → `/qa`
- `e2e-testing` — Tests end-to-end (Playwright) → `/e2e-testing`
- `browser-qa` — QA navigateur → `/browser-qa`
- `webapp-testing` — Tests webapp flows critiques → `/webapp-testing`
- `windows-desktop-e2e` — E2E Windows desktop → `/windows-desktop-e2e`
- `ai-regression-testing` — Tests regression pour code généré par IA → `/ai-regression-testing`
- `verification-loop` — Loop de vérification automatique → `/verification-loop`
- `eval-harness` — Harness d'évaluation LLM → `/eval-harness`
- `agent-eval` — Évaluation comparative d'agents IA → `/agent-eval`
- `benchmark` — Benchmarking performance → `/benchmark`
- `benchmark-methodology` — Méthodologie benchmark → `/benchmark-methodology`
- `benchmark-optimization-loop` — Loop optimisation benchmark → `/benchmark-optimization-loop`
- `click-path-audit` — Audit chemins de clic UX → `/click-path-audit`
- `verify` — Lance app et observe comportement réel → `/verify`

### 8. SÉCURITÉ
Skills pour audit et hardening sécurité.
- `security-review` — Review sécurité code (OWASP top 10) → `/security-review`
- `security-scan` — Scan vulnérabilités projet → `/security-scan`
- `security-bounty-hunter` — Approche bug bounty → `/security-bounty-hunter`
- `gateguard` — Garde-fous accès et permissions → `/gateguard`
- `safety-guard` — Guardrails sécurité agents IA → `/safety-guard`
- `firebase-security-rules-auditor` — Audit règles Firestore → `/firebase-security-rules-auditor`
- `hipaa-compliance` — Conformité HIPAA (santé US) → `/hipaa-compliance`
- `healthcare-phi-compliance` — Conformité données santé PHI → `/healthcare-phi-compliance`
- `defi-amm-security` — Sécurité AMM DeFi → `/defi-amm-security`
- `llm-trading-agent-security` — Sécurité agents trading LLM → `/llm-trading-agent-security`
- `django-security` — Sécurité Django → `/django-security`
- `laravel-security` — Sécurité Laravel → `/laravel-security`
- `perl-security` — Sécurité Perl → `/perl-security`
- `springboot-security` — Sécurité Spring Boot → `/springboot-security`
- `quarkus-security` — Sécurité Quarkus → `/quarkus-security`

### 9. QUALITÉ CODE / ARCHITECTURE
Skills pour améliorer et auditer la qualité du code.
- `code-review` — Review diff pour bugs/correctness → `/code-review`
- `simplify` — Simplification et réduction code → `/simplify`
- `improve-codebase-architecture` — Analyse et améliore archi globale → `/improve-codebase-architecture`
- `system-architect` — Conception architecture système → `/system-architect`
- `architecture-decision-records` — ADRs (Architecture Decision Records) → `/architecture-decision-records`
- `coding-standards` — Standards de code projet → `/coding-standards`
- `request-refactor-plan` — Plan refacto avant d'implémenter → `/request-refactor-plan`
- `codehealth-mcp` — Santé codebase via MCP → `/codehealth-mcp`
- `plankton-code-quality` — Qualité code fine-grained → `/plankton-code-quality`
- `repo-scan` — Scan complet dépôt → `/repo-scan`
- `production-audit` — Audit code production → `/production-audit`
- `agent-architecture-audit` — Audit stack agent IA 12 couches → `/agent-architecture-audit`
- `code-tour` — Tour guidé du codebase → `/code-tour`
- `codebase-onboarding` — Onboarding nouveau dev sur codebase → `/codebase-onboarding`
- `hexagonal-architecture` — Architecture hexagonale → `/hexagonal-architecture`

### 10. IA / AGENTS / LLM
Skills pour construire et orchestrer des agents IA.
- `claude-api` — Référence API Claude/Anthropic complète → `/claude-api`
- `agentic-engineering` — Engineering eval-first pour agents → `/agentic-engineering`
- `agentic-os` — OS multi-agent persistant sur Claude Code → `/agentic-os`
- `agent-harness-construction` — Design action spaces et tool definitions → `/agent-harness-construction`
- `agent-introspection-debugging` — Debug structuré échecs agent → `/agent-introspection-debugging`
- `agent-architecture-audit` — Audit complet stack agent → `/agent-architecture-audit`
- `agent-self-evaluation` — Auto-évaluation output agent (5 axes) → `/agent-self-evaluation`
- `agent-browser` — Agent contrôle navigateur (Playwright) → `/agent-browser`
- `mcp-builder` — Construit serveur MCP custom → `/mcp-builder`
- `mcp-server-patterns` — Patterns serveurs MCP → `/mcp-server-patterns`
- `autonomous-agent-harness` — Harness agent autonome → `/autonomous-agent-harness`
- `autonomous-loops` — Loops agents autonomes → `/autonomous-loops`
- `continuous-agent-loop` — Loop agent continu → `/continuous-agent-loop`
- `enterprise-agent-ops` — Ops agents enterprise → `/enterprise-agent-ops`
- `team-agent-orchestration` — Orchestration équipe d'agents → `/team-agent-orchestration`
- `team-builder` — Picker interactif pour composer équipes agents → `/team-builder`
- `council` — Panel d'agents en conseil → `/council`
- `cost-aware-llm-pipeline` — Pipeline LLM cost-aware → `/cost-aware-llm-pipeline`
- `prompt-optimizer` — Optimise prompts pour meilleurs résultats → `/prompt-optimizer`
- `context-budget` — Gestion budget contexte → `/context-budget`
- `iterative-retrieval` — Retrieval itératif (RAG avancé) → `/iterative-retrieval`
- `recsys-pipeline-architect` — Architecture pipeline recommandation → `/recsys-pipeline-architect`
- `deep-research` — Recherche multi-sources avec rapport cité → `/deep-research`
- `search-first` — Approche search-first avant implémentation → `/search-first`
- `plan-orchestrate` — Planification et orchestration workflows → `/plan-orchestrate`
- `dynamic-workflow-mode` — Mode workflow dynamique → `/dynamic-workflow-mode`
- `parallel-execution-optimizer` — Optimise exécution parallèle → `/parallel-execution-optimizer`
- `dmux-workflows` — Workflows DMUX → `/dmux-workflows`
- `intent-driven-development` — Développement piloté par intention → `/intent-driven-development`
- `ml-adoption-playbook` — Playbook adoption ML équipe → `/ml-adoption-playbook`
- `mle-workflow` — Workflow ML Engineer → `/mle-workflow`
- `pytorch-patterns` — Patterns PyTorch → `/pytorch-patterns`
- `ai-first-engineering` — Operating model teams IA-first → `/ai-first-engineering`
- `recursive-decision-ledger` — Ledger décisions récursif → `/recursive-decision-ledger`
- `gan-style-harness` — Harness GAN style transfer → `/gan-style-harness`
- `nanoclaw-repl` — REPL NanoClaw → `/nanoclaw-repl`
- `openclaw-persona-forge` — Forge de personas OpenClaw → `/openclaw-persona-forge`
- `claude-devfleet` — Fleet de devs Claude → `/claude-devfleet`
- `eval-harness` — Harness évaluation LLM → `/eval-harness`
- `exa-search` — Recherche via Exa MCP → `/exa-search`
- `fal-ai-media` — Génération media via fal.ai → `/fal-ai-media`
- `foundation-models-on-device` — LLM on-device → `/foundation-models-on-device`
- `agent-payment-x402` — Paiements x402 dans agents IA → `/agent-payment-x402`
- `prediction-market-oracle-research` — Recherche oracles marchés prédiction → `/prediction-market-oracle-research`
- `prediction-market-risk-review` — Review risque marchés prédiction → `/prediction-market-risk-review`

### 11. DEVOPS / GIT / CI-CD
Skills pour git, CI/CD, infra, déploiement.
- `git-workflow` — Workflow git (branches, commits, PRs) → `/git-workflow`
- `github-ops` — Opérations GitHub (issues, PRs, Actions) → `/github-ops`
- `git-guardrails-claude-code` — Guardrails git dans Claude Code → `/git-guardrails-claude-code`
- `setup-pre-commit` — Configure pre-commit hooks → `/setup-pre-commit`
- `docker-patterns` — Containerisation Docker → `/docker-patterns`
- `deployment-patterns` — Patterns déploiement → `/deployment-patterns`
- `kubernetes-patterns` — Patterns Kubernetes → `/kubernetes-patterns`
- `canary-watch` — Monitoring canary deployments → `/canary-watch`
- `config-gc` — Garbage collection config obsolète → `/config-gc`
- `hookify-rules` — Créer hooks à partir de règles → `/hookify-rules`
- `continuous-learning` — Apprentissage continu CI → `/continuous-learning`
- `continuous-learning-v2` — v2 apprentissage continu → `/continuous-learning-v2`
- `flox-environments` — Environnements Flox → `/flox-environments`
- `production-audit` — Audit code production → `/production-audit`

### 12. MARKETING / GROWTH / CONTENU
Skills pour marketing, acquisition, conversion.
- `marketing-ideas` — Brainstorm idées marketing → `/marketing-ideas`
- `product-marketing` — Positionnement et go-to-market → `/product-marketing`
- `content-strategy` — Stratégie contenu → `/content-strategy`
- `content-engine` — Machine à contenu automatisée → `/content-engine`
- `social` — Posts réseaux sociaux → `/social`
- `social-publisher` — Publication multi-plateforme → `/social-publisher`
- `crosspost` — Crossposter contenu → `/crosspost`
- `emails` — Campagnes email → `/emails`
- `cold-email` — Cold outreach B2B → `/cold-email`
- `email-ops` — Opérations email (ops, automatisation) → `/email-ops`
- `sms` — Campagnes SMS → `/sms`
- `ads` — Copy publicités → `/ads`
- `ad-creative` — Créa visuelle publicités → `/ad-creative`
- `community-marketing` — Marketing communautaire → `/community-marketing`
- `co-marketing` — Partenariats co-marketing → `/co-marketing`
- `competitor-profiling` — Profiling concurrents → `/competitor-profiling`
- `competitors` — Veille concurrentielle → `/competitors`
- `competitive-platform-analysis` — Analyse plateforme concurrente → `/competitive-platform-analysis`
- `competitive-report-structure` — Structure rapport compétitif → `/competitive-report-structure`
- `creative-intelligence` — Insights créatifs et tendances → `/creative-intelligence`
- `lead-magnets` — Lead magnets (ebooks, outils) → `/lead-magnets`
- `lead-intelligence` — Intelligence leads B2B → `/lead-intelligence`
- `free-tools` — Micro-outils gratuits pour acquisition → `/free-tools`
- `paywalls` — Stratégie et impl paywalls → `/paywalls`
- `popups` — Design et logique popups conversion → `/popups`
- `signup` — Optimisation flows inscription → `/signup`
- `referrals` — Programmes parrainage → `/referrals`
- `launch` — Plan lancement produit → `/launch`
- `ab-testing` — Tests A/B → `/ab-testing`
- `cro` — Conversion Rate Optimization → `/cro`
- `churn-prevention` — Réduction churn → `/churn-prevention`
- `connections-optimizer` — Optimise connexions réseau → `/connections-optimizer`
- `marketing-campaign` — Campagne marketing complète → `/marketing-campaign`
- `market-research` — Recherche marché → `/market-research`
- `social-graph-ranker` — Ranking graphe social → `/social-graph-ranker`

### 13. SEO / ANALYTICS
Skills pour référencement et analyse.
- `seo-audit` — Audit SEO complet → `/seo-audit`
- `seo` — SEO général → `/seo`
- `ai-seo` — SEO augmenté IA → `/ai-seo`
- `programmatic-seo` — SEO programmatique à grande échelle → `/programmatic-seo`
- `site-architecture` — Architecture site web (siloing, URLs) → `/site-architecture`
- `directory-submissions` — Soumission annuaires → `/directory-submissions`
- `analytics` — Setup et analyse analytics → `/analytics`
- `aso` — App Store Optimization → `/aso`
- `click-path-audit` — Audit chemins de navigation → `/click-path-audit`

### 14. PRODUCT / PROJECT MANAGEMENT
Skills pour gestion produit et projet.
- `product-manager` — Roadmap, user stories, priorisation → `/product-manager`
- `business-analyst` — Requirements, processus, KPIs → `/business-analyst`
- `scrum-master` — Facilitation Agile/Scrum → `/scrum-master`
- `to-prd` — Transforme idée en PRD → `/to-prd`
- `to-issues` — Découpe PRD en issues → `/to-issues`
- `triage` — Triage et priorisation backlog → `/triage`
- `premortem` — Analyse pre-mortem → `/premortem`
- `gsd` — Mode exécution "Get Shit Done" → `/gsd`
- `handoff` — Prépare handoff équipe → `/handoff`
- `onboarding` — Guide onboarding projet/équipe → `/onboarding`
- `revops` — Revenue Operations → `/revops`
- `sales-enablement` — Matériaux sales → `/sales-enablement`
- `customer-research` — Recherche utilisateur → `/customer-research`
- `investor-materials` — Matériaux investisseurs → `/investor-materials`
- `investor-outreach` — Outreach investisseurs → `/investor-outreach`
- `pricing` — Stratégie pricing → `/pricing`
- `product-capability` — Cartographie capacités produit → `/product-capability`
- `product-lens` — Analyse produit par lens → `/product-lens`
- `blueprint` — Blueprint projet/feature → `/blueprint`
- `project-flow-ops` — Ops flux projet → `/project-flow-ops`
- `jira-integration` — Intégration Jira → `/jira-integration`
- `plan-orchestrate` — Planification et orchestration → `/plan-orchestrate`

### 15. DOCUMENTATION / ÉCRITURE
Skills pour documentation et rédaction.
- `doc-coauthoring` — Co-rédaction documentation technique → `/doc-coauthoring`
- `article-writing` — Rédaction d'articles → `/article-writing`
- `edit-article` — Édition et amélioration article → `/edit-article`
- `copy-editing` — Correction et polissage texte → `/copy-editing`
- `copywriting` — Rédaction persuasive → `/copywriting`
- `writing-beats` — Structure narrative → `/writing-beats`
- `writing-fragments` — Micro-contenu et fragments → `/writing-fragments`
- `writing-shape` — Forme et structure texte long → `/writing-shape`
- `internal-comms` — Communications internes → `/internal-comms`
- `docx` — Export Word (.docx) → `/docx`
- `pptx` — Export PowerPoint (.pptx) → `/pptx`
- `pdf` — Export PDF → `/pdf`
- `xlsx` — Export Excel (.xlsx) → `/xlsx`
- `documentation-lookup` — Lookup documentation technique → `/documentation-lookup`
- `ecc-guide` — Guide ECC complet → `/ecc-guide`
- `frontend-slides` — Slides frontend → `/frontend-slides`

### 16. FINANCE / BUSINESS OPS
Skills pour opérations financières et business.
- `finance-billing-ops` — Ops facturation et finance → `/finance-billing-ops`
- `customer-billing-ops` — Facturation clients → `/customer-billing-ops`
- `cost-tracking` — Suivi coûts → `/cost-tracking`
- `ecc-tools-cost-audit` — Audit coûts outils ECC → `/ecc-tools-cost-audit`
- `inventory-demand-planning` — Planification stocks et demande → `/inventory-demand-planning`
- `production-scheduling` — Planification production → `/production-scheduling`
- `energy-procurement` — Procurement énergie → `/energy-procurement`
- `carrier-relationship-management` — Gestion relations transporteurs → `/carrier-relationship-management`
- `customs-trade-compliance` — Conformité douanes et commerce → `/customs-trade-compliance`
- `logistics-exception-management` — Gestion exceptions logistiques → `/logistics-exception-management`
- `returns-reverse-logistics` — Logistique retours → `/returns-reverse-logistics`
- `quality-nonconformance` — Non-conformités qualité → `/quality-nonconformance`
- `dashboard-builder` — Construit dashboards → `/dashboard-builder`
- `data-throughput-accelerator` — Accélérateur débit data → `/data-throughput-accelerator`

### 17. CLAUDE CODE / ECC / META
Skills pour configurer et optimiser Claude Code lui-même.
- `configure-ecc` — Configure ECC dans ton environnement → `/configure-ecc`
- `skill-creator` — Crée une nouvelle skill → `/skill-creator`
- `write-a-skill` — Rédige fichier skill complet → `/write-a-skill`
- `template-skill` — Template de base skill → `/template-skill`
- `skill-comply` — Conformité skill avec standards ECC → `/skill-comply`
- `skill-scout` — Découvre skills utiles → `/skill-scout`
- `skill-stocktake` — Inventaire skills installées → `/skill-stocktake`
- `agent-sort` — Trie skills ECC pour un repo spécifique → `/agent-sort`
- `find-skills` — Découvrir et installer skills → `/find-skills`
- `update-config` — Configure settings.json (hooks, permissions) → `/update-config`
- `keybindings-help` — Personnalise raccourcis clavier → `/keybindings-help`
- `fewer-permission-prompts` — Réduit les prompts de permission → `/fewer-permission-prompts`
- `loop` — Tâche récurrente sur intervalle → `/loop`
- `schedule` — Cloud agents planifiés (cron) → `/schedule`
- `token-optimizer` — Optimise prompts pour moins de tokens → `/token-optimizer`
- `token-coach` — Coaching réduction tokens → `/token-coach`
- `token-dashboard` — Dashboard consommation tokens → `/token-dashboard`
- `token-budget-advisor` — Conseils budget tokens → `/token-budget-advisor`
- `context-budget` — Gestion budget contexte conversation → `/context-budget`
- `fleet-auditor` — Audit flotte d'agents → `/fleet-auditor`
- `cost-tracking` — Suivi coûts agents → `/cost-tracking`
- `caveman` — Mode réponse caveman (terse) → `/caveman`
- `improve-codebase-architecture` — Améliore archi codebase → `/improve-codebase-architecture`
- `hookify-rules` — Crée hooks depuis règles → `/hookify-rules`
- `ecc-guide` — Guide ECC → `/ecc-guide`
- `claude-devfleet` — Fleet devs Claude → `/claude-devfleet`
- `continuous-learning` — Apprentissage continu → `/continuous-learning`
- `continuous-learning-v2` — v2 apprentissage continu → `/continuous-learning-v2`
- `workspace-surface-audit` — Audit surface workspace → `/workspace-surface-audit`
- `terminal-ops` — Opérations terminal → `/terminal-ops`
- `knowledge-ops` — Ops base de connaissances → `/knowledge-ops`
- `obsidian-vault` — Gestion vault Obsidian → `/obsidian-vault`

### 18. DOMAINES SPÉCIALISÉS
Skills pour domaines métier spécifiques.
- `healthcare-cdss-patterns` — Patterns CDSS santé → `/healthcare-cdss-patterns`
- `healthcare-emr-patterns` — Patterns EMR → `/healthcare-emr-patterns`
- `healthcare-eval-harness` — Eval harness santé → `/healthcare-eval-harness`
- `homelab-network-readiness` — Readiness réseau homelab → `/homelab-network-readiness`
- `homelab-network-setup` — Setup réseau homelab → `/homelab-network-setup`
- `homelab-pihole-dns` — DNS Pi-hole homelab → `/homelab-pihole-dns`
- `homelab-vlan-segmentation` — Segmentation VLAN → `/homelab-vlan-segmentation`
- `homelab-wireguard-vpn` — VPN WireGuard homelab → `/homelab-wireguard-vpn`
- `cisco-ios-patterns` — Patterns Cisco IOS → `/cisco-ios-patterns`
- `netmiko-ssh-automation` — Automation SSH Netmiko → `/netmiko-ssh-automation`
- `network-bgp-diagnostics` — Diagnostics BGP → `/network-bgp-diagnostics`
- `network-config-validation` — Validation config réseau → `/network-config-validation`
- `network-interface-health` — Santé interfaces réseau → `/network-interface-health`
- `ito-basket-compare` — Comparaison baskets ITO → `/ito-basket-compare`
- `ito-data-atlas-agent` — Agent data atlas ITO → `/ito-data-atlas-agent`
- `ito-market-intelligence` — Intelligence marché ITO → `/ito-market-intelligence`
- `ito-trade-planner` — Planificateur trades ITO → `/ito-trade-planner`
- `evm-token-decimals` — Décimales tokens EVM → `/evm-token-decimals`
- `defi-amm-security` — Sécurité AMM DeFi → `/defi-amm-security`
- `llm-trading-agent-security` — Sécurité agents trading → `/llm-trading-agent-security`
- `prediction-market-oracle-research` — Oracles marchés prédiction → `/prediction-market-oracle-research`
- `prediction-market-risk-review` — Risque marchés prédiction → `/prediction-market-risk-review`
- `scientific-db-pubmed-database` — Requêtes PubMed → `/scientific-db-pubmed-database`
- `scientific-db-uspto-database` — Requêtes USPTO brevets → `/scientific-db-uspto-database`
- `scientific-pkg-gget` — Package gget bioinformatique → `/scientific-pkg-gget`
- `scientific-thinking-literature-review` — Revue littérature scientifique → `/scientific-thinking-literature-review`
- `scientific-thinking-scholar-evaluation` — Évaluation scholar → `/scientific-thinking-scholar-evaluation`
- `blender-motion-state-inspection` — Inspection état motion Blender → `/blender-motion-state-inspection`
- `manim-video` — Vidéos explicatives avec Manim → `/manim-video`
- `remotion-video-creation` — Création vidéo avec Remotion → `/remotion-video-creation`
- `video-editing` — Édition vidéo → `/video-editing`
- `videodb` — Base de données vidéo → `/videodb`
- `fal-ai-media` — Génération media fal.ai → `/fal-ai-media`
- `image` — Génération/manipulation images → `/image`
- `whatsapp-cloud-api` — Intégration WhatsApp Cloud API → `/whatsapp-cloud-api`
- `messages-ops` — Opérations messaging → `/messages-ops`
- `google-workspace-ops` — Opérations Google Workspace → `/google-workspace-ops`
- `unified-notifications-ops` — Notifications unifiées → `/unified-notifications-ops`
- `slack-gif-creator` — GIFs animés Slack → `/slack-gif-creator`
- `visa-doc-translate` — Traduction documents visa → `/visa-doc-translate`
- `energy-procurement` — Procurement énergie → `/energy-procurement`
- `data-scraper-agent` — Agent scraping data → `/data-scraper-agent`
- `ck` — CK patterns → `/ck`
- `hermes-imports` — Imports Hermes → `/hermes-imports`
- `generating-python-installer` — Génère installer Python → `/generating-python-installer`
- `nodejs-keccak256` — Keccak256 Node.js → `/nodejs-keccak-256`
- `nutrient-document-processing` — Traitement documents nutritionnels → `/nutrient-document-processing`
- `santa-method` — Méthode Santa → `/santa-method`
- `automation-audit-ops` — Audit automatisation ops → `/automation-audit-ops`

---

## Instructions d'exécution

Quand `/skill-search [tâche]` est invoqué :

### Étape 1 — Identifier les catégories
Analyser la tâche et mapper vers 1-3 catégories de la taxonomie ci-dessus.

### Étape 2 — Format de réponse

```
## Skill Search — "[tâche décrite]"

**Catégories matchées :** [liste]

---

### TOP PICK
| Skill | Fonction | Commande |
|-------|----------|----------|
| `nom-skill` | Ce qu'elle fait en 1 ligne | `/nom-skill` |

### SKILLS SECONDAIRES
| Skill | Fonction | Commande |
|-------|----------|----------|
| `skill-1` | ... | `/skill-1` |
| `skill-2` | ... | `/skill-2` |

### PIPELINE RECOMMANDÉ (si applicable)
1. `/skill-a` → [pourquoi en premier]
2. `/skill-b` → [pourquoi après]
3. `/skill-c` → [pourquoi en dernier]
```

### Règles de réponse
- Top pick = 1 seule skill, la plus directement utile
- Secondaires = max 5-8, triées par pertinence décroissante
- Pipeline = seulement si la tâche a une séquence logique évidente
- Contexte Lemon : biaiser vers Flutter/Firebase/Dart quand pertinent
- Commande = syntaxe exacte copier-coller