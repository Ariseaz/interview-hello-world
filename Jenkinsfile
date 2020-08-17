pipeline {
  agent { docker { image 'python:3.7.2' } }
  stages {
    
    stage('Unit test') {
      steps {
        sh '''
              python -m venv .venv
              . .venv/bin/activate
              pip install -r requirements.txt
              pytest -v
            ''' 
      }   
    }

    stage('Get Source') {
      // copy source code from local file system and test
      // for a Dockerfile to build the Docker image
      steps {
        sh '''
        if (!fileExists("Dockerfile")) {
            error('Dockerfile missing.')
        }
        '''
      }
   }

    stage('Build Docker') {
       // build the docker image from the source code using the BUILD_ID parameter in image name
        steps {
         sh "sudo docker build -t flask-app ."
        }
   }
    


  }
}
