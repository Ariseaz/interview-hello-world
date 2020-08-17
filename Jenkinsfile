node {
   
   stage('Unit Test') {
      // run the unit tests
      {
         sh ". .env/bin/activate"
         sh "pip install -r requirements.txt"
         sh "python -m pytest tests/test_app.py"
      }
   }
   stage('Build Docker') {
       // build the docker image from the source code using the BUILD_ID parameter in image name
        {
         sh "docker build -t helloworldapp-${BUILD_ID} ."
       }
   }
}
