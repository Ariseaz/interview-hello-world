pipeline {
  agent { docker { image 'python:3.7.2' } }
  stages {
    stage('build') {
      steps {
        sh  '''
                python -m venv .venv
                . .venv/bin/activate
                pip install -r requirements.txt'
            '''
      }
    }
    stage('Unit Test') {
      steps {
        sh 'pytest -v'
      }   
    }
  }
}
