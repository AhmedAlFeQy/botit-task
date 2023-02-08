pipeline {
  agent { label "slave"}
  stages {
    
    stage('Checkout SCM') {
      steps {
        checkout([
          $class: 'GitSCM',
          branches: [[name: 'main']],
          userRemoteConfigs: [[
          url: 'git@github.com:AhmedAlFeQy/botit-task.git',
          credentialsId: '',
              ]]
            ])
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
