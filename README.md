# labo-infra-cloud

Dépôt de configurations Terraform pour les environnements cloud.

## Environnements

| Environnement | Type d'instance | Nombre |
|---------------|-----------------|--------|
| test          | t3.small        | 1      |
| staging       | t3.medium       | 2      |

## Utilisation

    cd env/test
    terraform init
    terraform plan

## Contribution

Voir [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md).
