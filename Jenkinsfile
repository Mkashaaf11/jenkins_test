pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-docker-image'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository
                echo "cloning"
                git url: 'https://github.com/Mkashaaf11/jenkins_test.git', branch : "master"
                echo "Cloned"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container and execute the shell script inside it
                    docker.image("${IMAGE_NAME}").inside {
                        sh './script.sh'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and run were successful!'
        }

        failure {
            echo 'There was an issue with the build or script.'
        }
    }
}
