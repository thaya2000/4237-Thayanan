pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/thaya2000/4237-Thayanan.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("react-docker:tag")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container and capture the container ID
                    def containerId = docker.image("react-docker:tag").run("-d -p 8083:8083 --name react-docker")
                    // Store the container ID in an environment variable for later use
                    env.CONTAINER_ID = containerId
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                // Verify deployment
                sh 'curl http://localhost:8083' // Example: Use curl to check if the application is running
            }
        }
    }

    post {
        always {
            // Stop and remove the Docker container
            sh "docker stop ${env.CONTAINER_ID}"
            sh "docker rm ${env.CONTAINER_ID}"
        
            // Remove the Docker image
            sh "docker rmi react-docker:tag"
        }
    }

}
