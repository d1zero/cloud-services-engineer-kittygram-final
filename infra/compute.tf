resource "yandex_compute_instance" "kittygram_vm" {
  name = "kittygram_vm"

  platform_id = "standard-v3"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = 15
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram_subnet.id
    security_group_ids = [yandex_vpc_security_group.kittygram_sg.id]
    nat                = true
  }

  metadata = {
    user-data = file("cloud-init.yaml")
    ssh-keys  = "ubuntu:${var.ssh_pub_key}"
  }
}