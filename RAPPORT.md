# Rapport de laboratoire Git/GitHub

**Étudiant :** mtatiotugnoua
**Email :** mtatiotugnoua@gmail.com
**Date :** 2026-09-17
**Cours :** CR 460 — Infonuagique
**Laboratoire :** Git et GitHub — Atelier pratique

---

## 1. Objectifs du laboratoire

- Comprendre la différence entre Git (gestion de versions) et GitHub (plateforme de collaboration).
- Maîtriser le flux de travail : branche → commit → push → Pull Request → fusion.
- Savoir résoudre un conflit Git.
- Configurer une CI (Continuous Integration) avec GitHub Actions.
- Protéger la branche principale.
- Contribuer à un dépôt sans droits d'écriture via un fork.

---

## 2. Environnement technique

| Élément | Valeur |
|---------|--------|
| Système d'exploitation | Windows |
| Terminal | Git Bash (MINGW64) |
| Git | Version installée |
| Éditeur | VS Code / Bloc-notes |
| Compte GitHub | mtatiotugnoua |
| Dépôt | https://github.com/mtatiotugnoua/labo-infra-cloud |

---

## 3. Structure du dépôt

labo-infra-cloud/
├── .github/
│ └── workflows/
│ └── validate.yml → Workflow CI GitHub Actions
├── env/
│ ├── test/
│ │ └── variables.tf → Variables Terraform pour test
│ └── staging/
│ └── variables.tf → Variables Terraform pour staging
├── docs/
│ └── CONTRIBUTING.md → Guide de contribution
├── .gitignore → Fichiers ignorés par Git
├── LICENSE → Licence MIT
├── README.md → Documentation principale
└── RAPPORT.md → Ce rapport

text

---

## 4. Étapes réalisées

### 4.1 Configuration initiale

```bash
git config --global user.name "mtatiotugnoua"
git config --global user.email "mtatiotugnoua@gmail.com"
git config --global init.defaultBranch main
git config --global pull.ff only
4.2 Création du dépôt
Dépôt créé sur GitHub : mtatiotugnoua/labo-infra-cloud

Visibilité : publique

README, .gitignore (Terraform), licence MIT inclus

4.3 Structuration du projet
Branche feat/structurer-projet

Création des dossiers env/, docs/, .github/workflows/

Création des fichiers variables.tf, CONTRIBUTING.md, README.md

Commit et push

Pull Request #1 fusionnée

4.4 Résolution d'un conflit
Branche feat/alice-augmenter-test : modification de t3.small → t3.medium

Branche feat/bob-augmenter-test : modification de t3.small → t3.large

Fusion d'Alice d'abord (PR #2)

PR de Bob (#3) → conflit sur la même ligne

Résolution manuelle : conservation de t3.medium

Commit de résolution : merge: résoudre le conflit sur la taille d'instance de test

Fusion finale

4.5 CI avec GitHub Actions
Fichier .github/workflows/validate.yml

Déclenchement sur chaque Pull Request vers main

Étapes : checkout, installation Terraform, terraform fmt, vérification des fichiers

Pull Request #4 fusionnée

4.6 Protection de branche
Règle activée sur main :

Require a pull request before merging

Require approvals : 1

Require status checks to pass before merging

Require conversation resolution before merging

Do not allow bypassing the above settings

Test : push direct refusé par GitHub

4.7 Bonnes pratiques appliquées
Aucun secret commité.

.gitignore adapté (Terraform).

Messages de commit clairs et descriptifs.

Petites Pull Requests.

CI obligatoire avant fusion.

5. Commandes les plus utiles
bash
# Configuration
git config --global user.name "Nom"
git config --global user.email "email@example.com"

# Clonage
git clone https://github.com/user/repo.git

# Branches
git switch -c feat/ma-branche
git switch main
git branch -a
git branch -d ma-branche

# Modifications
git status
git add .
git commit -m "feat: description"
git push -u origin feat/ma-branche

# Synchronisation
git pull --ff-only
git fetch --prune

# Historique
git log --oneline --graph --all
git log -p

# Nettoyage
git reset --hard HEAD~1
6. Difficultés rencontrées
6.1 Conflit Git
Symptôme : lors du merge de la branche de Bob, Git a signalé un conflit dans env/test/variables.tf.

Cause : les deux branches modifiaient la même ligne.

Solution :

git fetch origin

git merge origin/main

Édition manuelle du fichier pour choisir t3.medium

Suppression des marqueurs <<<<<<<, =======, >>>>>>>

git add env/test/variables.tf

git commit -m "merge: résoudre le conflit..."

git push

6.2 Heredoc et backticks
Symptôme : lors de la création du README, la commande cat > README.md << 'EOF' a été interrompue par des triples backticks.

Cause : les triples backticks dans le contenu étaient interprétés par le shell.

Solution : remplacer les triples backticks par une indentation de 4 espaces.

7. Ce que j'ai appris
7.1 Concepts clés
Git est un système distribué de gestion de versions. Il fonctionne en local.

GitHub est une plateforme hébergée qui ajoute la collaboration.

Un commit est local. Un push est réseau.

Une branche est un pointeur mobile.

Une Pull Request est un objet GitHub. git pull est une commande Git.

Un fork est une copie distante. Un clone est une copie locale.

7.2 Bonnes pratiques
Toujours protéger main.

Faire des petits commits avec des messages clairs.

Ne jamais committer de secrets.

Utiliser .gitignore.

Automatiser avec la CI.

Séparer revue de code et approbation de production.

7.3 Compétences acquises
Créer et configurer un dépôt Git.

Utiliser les branches.

Résoudre un conflit.

Configurer GitHub Actions.

Protéger une branche.

Contribuer via un fork.

8. Conclusion
Ce laboratoire m'a permis de maîtriser le flux de travail Git/GitHub complet, depuis la création d'un dépôt jusqu'à la configuration d'une CI et la protection de branche. Ces compétences sont essentielles pour tout travail en équipe sur du code, et particulièrement en DevOps et en infonuagique.

Le mécanisme branche → commit → Pull Request → fusion est la base de tout projet collaboratif moderne. La traçabilité qu'il offre permet de savoir qui a proposé, revu, testé et fusionné chaque changement.

9. Livrables
Dépôt GitHub : https://github.com/mtatiotugnoua/labo-infra-cloud

Captures d'écran :

Historique Git (git log --graph)

Protection de branche (Settings → Branches)

Workflow CI vert (onglet Actions)

Résolution de conflit

PR fusionnées

Fin du rapport
