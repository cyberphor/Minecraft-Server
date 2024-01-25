variable "location" {
  type = string
  default = "eastus"
}

variable "resource_group" {
  type = string
  default = "demo"
}

variable "image" {
  type    = string
  default = "minecraft-server"
}

variable "image_version" {
  type    = string
  default = "v1.0.0"
}

variable "container_port" {
  type    = number
  default = 1337
}

variable "share_name" {
  type    = string
  default = "minecraft-server-world"
}

variable "volume_mount_path" {
  type    = string
  default = "/opt/minecraft-server/world"
}