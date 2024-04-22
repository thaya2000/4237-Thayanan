pipeline {
    agent any

    // environment {
    //     HTTP_PROXY = 'http://10.50.225.222:3128'
    //     HTTPS_PROXY = 'http://10.50.225.222:3128'
    // }

    stages {
        stage('Clone Repository') {
            steps {
                // script {
                //     sh 'git config --global http.proxy http://10.50.225.222:3128'
                //     sh 'git config --global https.proxy http://10.50.225.222:3128'
                // }
                // Clone the repository
                git branch: 'main', url: 'https://github.com/thaya2000/4237-Thayanan.git'
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
