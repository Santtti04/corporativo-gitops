# corporativo-gitops

Pipeline GitOps completo: Terraform + Ansible + Jenkins

## Estructura
```
corporativo-gitops/
├── Jenkinsfile          # Pipeline CI/CD
├── terraform/
│   └── main.tf          # Infraestructura como Codigo
└── ansible/
    ├── playbook.yml     # Playbook principal
    └── roles/
        └── webserver/   # Rol de configuracion
```

## Flujo del Pipeline
1. Checkout del codigo desde GitHub
2. Validacion de Terraform
3. Aprobacion manual
4. Terraform Apply (crea infraestructura)
5. Ansible Deploy (configura servidor)
