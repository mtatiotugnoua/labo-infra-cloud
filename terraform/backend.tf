terraform {
  required_version = "1.16.3"

  cloud {
    organization = "MauriceTT_terraform-org"

    workspaces {
      name = "labo-azure"
    }
  }
}
