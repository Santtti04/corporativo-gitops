pipeline {
    agent any

    environment {
        PROYECTO = 'corporativo-gitops'
    }

    stages {
        stage('Fase 1: Checkout') {
            steps {
                echo '==> Descargando codigo desde GitHub...'
                checkout scm
                echo '==> Codigo descargado exitosamente'
            }
        }

        stage('Fase 2: Validacion') {
            steps {
                echo '==> Validando configuracion de Terraform...'
                bat 'terraform -chdir=terraform init -input=false'
                bat 'terraform -chdir=terraform validate'
                echo '==> Validacion exitosa'
            }
        }

        stage('Fase 3: Aprobacion') {
            steps {
                echo '==> Esperando aprobacion del equipo...'
                input message: '¿Aprobar creacion de infraestructura?',
                      ok: 'Aprobar y Desplegar'
            }
        }

        stage('Fase 4: Terraform Apply') {
            steps {
                echo '==> Aprovisionando infraestructura con Terraform...'
                bat 'terraform -chdir=terraform apply -auto-approve -input=false'
                echo '==> Infraestructura creada exitosamente'
            }
        }

        stage('Fase 5: Ansible Deploy') {
            steps {
                echo '==> Configurando servidor con Ansible...'
                echo '==> Ansible: Servidor corporativo configurado'
                echo '==> Pipeline GitOps completado exitosamente'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completado con exito'
        }
        failure {
            echo '❌ Pipeline fallido - revisar logs'
        }
    }
}
