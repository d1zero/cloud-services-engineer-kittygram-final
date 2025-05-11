resource "yandex_vpc_network" "kittygram_network" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "kittygram_subnet" {
  name           = "kittygram-subnet"
  network_id     = yandex_vpc_network.kittygram_network.id
  v4_cidr_blocks = var.subnet_cidr
  zone           = var.yc_zone
}

resource "yandex_vpc_security_group" "kittygram_sg" {
  name        = "kittygram-sg"
  description = "Security Group для Kittygram: разрешаем входящие соединения только на SSH (22) и HTTP (80)"
  network_id  = yandex_vpc_network.kittygram_network.id

  ingress {
    protocol    = "TCP"
    from_port   = 22
    to_port     = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "TCP"
    from_port   = 80
    to_port     = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "TCP"
    from_port   = 0
    to_port     = 0
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}