# Guide de contribution

## Flux de travail

1. Créer une branche depuis `main` : `git switch -c feat/ma-fonctionnalite`
2. Faire des commits atomiques avec un message clair.
3. Pousser la branche : `git push -u origin feat/ma-fonctionnalite`
4. Ouvrir une Pull Request vers `main`.
5. Attendre la revue et les tests CI.
6. Fusionner après approbation.

## Convention de commits

- `feat:` nouvelle fonctionnalité
- `fix:` correction de bug
- `docs:` documentation
- `chore:` maintenance

## Règles

- Ne jamais committer de secrets.
- Toujours tester localement avant de pousser.
