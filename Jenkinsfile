pipeline {
    agent any

    // After my agent any and before stages, a new object called environment
    // This object will contain all of my environment variables I want to use for the pipeline
    environment {
        //  This as an env var is hard coded in anyway and doesnt help with confidentiality
        FAV_COLOUR = "Purple"
        DOCKER_PASSWORD = credentials('secret_password') // We upload our password to Jenkins, and access its ID
    }

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
                sh "sleep 2"
                sh "curl localhost"
            }
        }
        stage('Env Vars'){
            steps {
                sh "echo $FAV_COLOUR"
                sh "echo $DOCKER_PASSWORD"
                sh "chmod +x vars_script.sh"
                sh "./vars_script.sh"
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