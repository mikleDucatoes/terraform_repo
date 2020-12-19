provider "yandex" {
  token                    = "AgAAAAAOutYBAATuwXD1hUuAY0athDDBZFL7mEU"
  cloud_id                 = "b1gi7n41b2r9nmfi5qkm"
  folder_id                = "b1gg7u6gqur8jfr367np"
  zone                     = "ru-central1-a"
}

resource "yandex_compute_disk" "default" {

  name = "vm0-hdd"
  type = "network-hdd"
  zone = "ru-central1-a"
  size = "40"
 }

