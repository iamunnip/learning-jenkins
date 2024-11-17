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
                }
            }
            steps {
                sh 'echo "Hello from Jenkins Agent Docker Container"'
                sh 'cat /etc/issue'
            }
        }
    }
}
