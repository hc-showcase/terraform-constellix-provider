variable "constellix_api_key" {}
variable "constellix_secret_key" {}

provider "constellix" {
  apikey    = var.constellix_api_key
  secretkey = var.constellix_secret_key
  insecure  = false
}

data "constellix_domain" "domain" {
  name = "msk.pub"
}

output "domain" {
  value = data.constellix_domain.domain
}
