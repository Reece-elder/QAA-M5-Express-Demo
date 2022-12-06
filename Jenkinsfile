pipeline {
    agent any
    stages {
        stage('Build'){
            steps {
                sh "echo build"
                sh "docker build -t node-app ."
            }
        }
        stage('Deploy'){
            steps {
                sh "docker run -d -p 80:80 --name node-cont node-app"
                sh "curl localhost"
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}