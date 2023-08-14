pipeline{
    agent {
     node 'dev-agent'}
  environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerHub')     
} 
  
     stages{
         stage('Code'){
             steps {
                 git branch: 'main', url: 'https://github.com/pintu121/pintu.git'
             }
         }
         stage('Build and test'){
             steps {
                 //sh 'docker image tag mytodoapp:latest mytodoapp:old'
                 sh 'docker build . -t pin2patra/mytodo:latest'
                 //sh 'docker image tag pin2patra/mytodo:$BUILD_NUMBER pin2patra/mytodo:latest'
                 //sh 'docker image rm mytodo:delete'
             }
         }
         stage('Login to Docker Hub') {         
           steps{                            
	          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	          echo 'Login Completed'                
            }           
         }    
         stage('Push Image to Docker Hub') {         
          steps {                            
	          sh 'sudo docker push pin2patra/mytodo:latest'                 
	          echo 'Push Image Completed'       
             }           
         }  
         stage('deployment'){
             steps {
                 sh 'docker-compose down && docker-compose up -d'
             }
         }
     }
}
