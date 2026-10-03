terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "inventario_ansible" {
  filename = "${path.module}/../ansible/inventario.ini"
  content  = <<-INI
    [servidores]
    servidor-corporativo ansible_host=127.0.0.1 ansible_connection=local

    [servidores:vars]
    ansible_python_interpreter=/usr/bin/python3
  INI
}

resource "local_file" "servidor_info" {
  filename = "${path.module}/../servidor_info.txt"
  content  = <<-TXT
    === INFRAESTRUCTURA CORPORATIVA ===
    Servidor: servidor-corporativo
    IP: 127.0.0.1
    Estado: APROVISIONADO
    Fecha: ${timestamp()}
    Herramientas: Terraform + Ansible + Jenkins
  TXT
}

output "infraestructura_lista" {
  value = "Infraestructura aprovisionada correctamente"
}
