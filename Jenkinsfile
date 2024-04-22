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
        // Cleanup
        script {
            // Get the container ID from the environment variable
            def containerId = env.CONTAINER_ID
            
            // Stop and remove the Docker container using the container ID
            sh "docker stop $containerId"
            sh "docker rm $containerId"
        }
    }
}


}
