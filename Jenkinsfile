pipeline {
    agent {
        label 'jenkins-agent'
    }

    stages {
        stage('Hello from Jenkins Agent') {
            steps {
                sh 'echo "Hello from Jenkins Agent"'
                sh 'cat /etc/issue'
            }
        }
        stage('Hello from Jenkins Agent Docker Container') {
            agent {
                docker {
                    image "ubuntu"
                    reuseNode true
                }
            }
            steps {
                sh 'echo "Hello from Jenkins Agent Docker Container"'
                sh 'cat /etc/issue'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image "node:latest"
                    reuseNode true
                }
            }
            steps {
                sh'''
                    cat /etc/issue
                    echo "Building image using Node"
                '''
            }
        }
        stage('Push') {
            agent {
                docker {
                    image "docker:dind"
                    reuseNode true
                }
            }
            steps {
                sh'''
                    cat /etc/issue
                    echo "Taggig image"
                    docker image tag node:latest node:v1
                '''
            }
        }
    }
}
