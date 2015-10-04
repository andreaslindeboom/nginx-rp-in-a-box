provider "digitalocean" {
    token = "${var.digitalocean.access_token}"
}

resource "digitalocean_droplet" "nginx-rp" {
    image = "13820512"
    name = "nginx-rp"
    region = "ams3"
    size = "512mb"
}

resource "digitalocean_domain" "default" {
    name = "mesos.oddit.nl"
    ip_address = "${digitalocean_droplet.nginx-rp.ipv4_address}"
}
