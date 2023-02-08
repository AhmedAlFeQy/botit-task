pipeline {
  agent { label "slave"}
  stages {
        stage('test build') {
      steps {
        script {
       
            withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'username', passwordVariable: 'password')]) {
              sh """
        
                  docker login -u ${username} -p ${password}
                  docker build -t ahmedalfeqy/botitapptest:${BUILD_NUMBER} .
                  docker push ahmedalfeqy/botitapptest:${BUILD_NUMBER}
                  echo ${BUILD_NUMBER} > ../botitapptest-build-number.txt
              """
          }
        } 
      }
    }
   
    stage('Test') {
      steps {
         script {
              sh """
             docker run ahmedalfeqy/botitapptest:${BUILD_NUMBER} 

              """
          }

         }  
      }
    stage('build') {
      steps {
        script {
       
            withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'username', passwordVariable: 'password')]) {
              sh """
        
                  docker login -u ${username} -p ${password}
                  docker build -t ahmedalfeqy/botitapp:${BUILD_NUMBER} .
                  docker push ahmedalfeqy/botitapp:${BUILD_NUMBER}
                  echo ${BUILD_NUMBER} > ../botitapp-build-number.txt
              """
          }
        } 
      }
    }
    stage('deploy') {
    
      steps {
        script {

            withCredentials([file(credentialsId: 'key', variable: 'key')]) {
              sh """
                  gcloud auth activate-service-account admin-36@botit-377021.iam.gserviceaccount.com --key-file ${key}
        
                """
            }
        


            withCredentials([file(credentialsId: 'kube', variable: 'KUBECONFIG')]) {
              sh """
                  export BUILD_NUMBER=\$(cat ../botitapp-build-number.txt)
                  mv APP/deploy.yaml APP/deploy.yaml.tmp
                  cat APP/deploy.yaml.tmp | envsubst > APP/deploy.yaml
                  rm -f APP/deploy.yaml.tmp
                  kubectl apply -f APP --kubeconfig=${KUBECONFIG}
                """
            }
        }
      }
    }
  }
}
