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
                sh  '''
                        python -m venv .venv
                        . .venv/bin/activate
                        pip install -r requirements.txt
                        python3 -m flask run hello 
                    ''' 
            }
        }
        stage('Test') { 
            steps {
                sh 'pytest -v --junit-xml test-reports/results.xml' 
            }
            post {
                always {
                    junit 'test-reports/results.xml' 
                }
            }
        }
    }
}
