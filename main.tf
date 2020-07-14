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

resource "constellix_a_record" "firstrecord" {
  domain_id     = data.constellix_domain.domain.id
  source_type   = "domains"
  ttl           = 100
  name          = "firstrecord"
  type          = "A"
  note          = "First record"
  roundrobin {
    value        = "5.45.25.35"
    disable_flag = "false"
  }
}

output "domain" {
  value = data.constellix_domain.domain
}
