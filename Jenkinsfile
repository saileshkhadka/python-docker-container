pipeline {
    agent any
 stages {
     stage('Build Docker image and Tag') {
               steps {

                    sh 'docker build -t sailesh081/task04_sailesh:latest .'
                    sh 'docker tag sailesh081/task04_sailesh:latest sailesh081/task04_sailesh:$BUILD_NUMBER'
              }
            }
     
     stage('Publish image on Docker-Hub') {

                steps {
            withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
              sh  'docker push sailesh081/task04_sailesh:$BUILD_NUMBER'
            }
         }
     }

   stage('Run the Docker container on remote hosts 10.0.0.11') {

                steps {
            withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
              sh  'docker pull sailesh081/task04_sailesh:$BUILD_NUMBER'
              sh  'docker -H "ssh://vagrant@10.0.0.11" run -d -p 85:80 --name=helloworld sailesh081/task04_sailesh:$BUILD_NUMBER'
            }
         }
         }
         
  }
}
