provider "digitalocean" {
    token = "${var.digitalocean.access_token}"
}

resource "digitalocean_ssh_key" "nginx" {
    name = "${var.ssh_key.name}"
    public_key = "${file(var.ssh_key.path)}"
}

resource "digitalocean_droplet" "nginx-rp" {
    image = "13820512"
    name = "nginx-rp"
    region = "ams3"
    size = "512mb"
    ssh_keys = ["${digitalocean_ssh_key.nginx.id}"]
}
