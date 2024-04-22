pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git 'https://github.com/thaya2000/4237-Thayanan.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build("react-docker:tag")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run Docker container
                script {
                    docker.image("react-docker:tag").run("-d -p 8083:8083 --name react-docker")
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
            // Cleanup
            script {
                docker.image("react-docker:tag").stop()
                docker.image("react-docker:tag").remove(force: true)
            }
        }
    }
}
