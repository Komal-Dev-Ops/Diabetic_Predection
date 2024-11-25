pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "komal/ml-flask-app" // Name for the Docker image
        CONTAINER_NAME = "ml-flask-container"
        PORT = "5005"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone repository
                git branch: 'main', url: 'https://github.com/Komal-Dev-Ops/Diabetic_Predection_Deployment_AWS_Beanstalk.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh '''
                    if [ $(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                        docker stop ${CONTAINER_NAME}
                        docker rm ${CONTAINER_NAME}
                    fi
                    '''
                }
            }
        }
        stage('Run New Container') {
            steps {
                // Run the new Docker container
                sh 'docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${DOCKER_IMAGE}'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}
