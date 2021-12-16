pipeline {
    agent any
 stages {
     stage('Build Docker image and Tag') {
               steps {

                    sh 'docker build -t sailesh081/test_pipeline:latest .'
                    sh 'docker tag sailesh081/test_pipeline:latest sailesh081/test_pipeline:5'
              }
            }
     
     stage('Publish image on Docker-Hub') {

                steps {
            withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
              sh  'docker push sailesh081/test_pipeline:latest'
              sh  'docker push sailesh081/test_pipeline:5'
            }
         }
     }

   stage('Run the Docker container on remote hosts 10.0.0.11') {

                steps {
             
               sh  'docker -H ssh://vagrant@10.0.0.11 run -d -p 85:80 --name=helloworld sailesh081/test_pipeline'
            
         }
         }
         
  }
}
