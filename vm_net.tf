provider  "yandex" {
    token                    = "AgAAAAAOutYBAATuwXD1hUuAY0athDDBZFL7mEU"
    cloud_id                 = "b1gi7n41b2r9nmfi5qkm"
    folder_id                = "b1gg7u6gqur8jfr367np"
    zone                     = "ru-central1-a"
    }
    
resource "yandex_compute_instance"  "vm-HA" {
  name="terraform-HAproxy-server"
  resources {
    cores = 2
    memory= 4
    }
    
      boot_disk {
          initialize_params {
                image_id = "fd87va5cc00gaq2f5qfb"
                    }
                 }
      network_interface {
          subnet_id = yandex_vpc_subnet.subnet-1.id
          nat       = true
                        }
     metadata = {
          ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
                }
       }
  
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
resource "yandex_vpc_subnet" "subnet-1" {
  name = "subnet1"
  zone = "ru-central1-a"
  network_id  = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
output "internal_ip_address_vm_1" {
      value = yandex_compute_instance.vm-1.network_interface.0.ip_address
      }
                                                  
 output "internal_ip_address_vm_2" {
        value = yandex_compute_instance.vm-2.network_interface.0.ip_address
        }
                                                        
                                                        
 output "external_ip_address_vm_1" {
      value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
      }
 output "external_ip_address_vm_2" {
      value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
      }