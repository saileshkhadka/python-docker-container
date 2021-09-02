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
         
  }
}
