variable "yc_token" {
  description = "API токен для доступа к Yandex Cloud"
  type        = string
}

variable "yc_cloud_id" {
  description = "ID облака в Yandex Cloud"
  type        = string
}

variable "yc_folder_id" {
  description = "ID каталога (folder) в Yandex Cloud"
  type        = string
}

variable "yc_zone" {
  description = "ID каталога (folder) в Yandex Cloud"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_cidr" {
  description = "CIDR блок для подсети"
  type        = list(string)
  default     = ["10.10.0.0/24"]
}

variable "vm_image_id" {
  description = "ID образа ОС для ВМ"
  type        = string
  default     = "fd85m9q2qspfnsv055rh" // ubuntu-24-04-lts-v20250324
}

variable "ssh_pub_key" {
  description = "Публичный SSH-ключу"
  type        = string
}