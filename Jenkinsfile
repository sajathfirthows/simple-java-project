pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "sajath/simple-java-app:latest"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sajathfirthows/simple-java-project.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh """
                    echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                    docker push $DOCKER_IMAGE
                    """
                }
            }
        }
    }
}

