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
                        python3 -m flask run hello/hello.py 
                    ''' 
            }
        }
        stage('Test') { 
            agent {
                docker {
                    image 'qnib/pytest' 
                }
            }
            steps {
                sh 'py.test --junit-xml test-reports/results.xml tests' 
            }
            post {
                always {
                    junit 'test-reports/results.xml' 
                }
            }
        }
    }
}
