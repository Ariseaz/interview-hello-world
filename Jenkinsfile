node {
   stage('Get Source') {
      // copy source code from local file system and test
      // for a Dockerfile to build the Docker image
      git ('https://github.com/Ariseaz/interview-hello-world.git')
      if (!fileExists("Dockerfile")) {
         error('Dockerfile missing.')
      }
   }

   stage('Test') {
            agent {
                docker {
                    image 'python:3.7.2'
                }
            }
            steps {
                sh '''
                    python -m venv .venv
                    . .venv/bin/activate
                    pip install -r requirements.txt
                    pytest -v
                ''' 
            }
            
        }

   stage('Build Stage') {
       // build the docker image from the source code using the BUILD_ID parameter in image name
         sh "sudo docker build -t flask-app ."
   }
   stage("run docker container"){
        sh "sudo docker run -p 8000:8000 --name flask-app -d flask-app "
    }
}
