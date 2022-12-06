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
                sh "docker run -d -p 80:5000 --name node-cont node-app"
                sh "sleep 5"
                sh "curl localhost"
            }
        }
    }
    post { 
        always { 
            cleanWs()
            sh "docker rm -f node-cont"
        }
    }
}