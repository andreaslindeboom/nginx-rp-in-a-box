provider "digitalocean" {
    token = "${var.digitalocean.access_token}"
}

resource "digitalocean_droplet" "nginx-rp" {
    image = "13820512"
    name = "nginx-rp"
    region = "ams3"
    size = "512mb"
}
