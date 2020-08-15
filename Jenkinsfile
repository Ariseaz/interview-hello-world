pipeline {
    agent none 
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'python:3.7.2' 
                }
            }
            steps {
                sh 'export FLASK_APP=hello/hello.py python3 -m flask run' 
            }
        }
    }
}
