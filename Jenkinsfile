pipeline{
    agent any
    environment{
       DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    stages{
        stage('checkscm'){
          steps{
            checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github', url: 'https://github.com/jeevitha700/capstoneproject.git']])
          }
    
        }
        
        stage('build'){
          steps{
              
              echo "building the application"
              sh "chmod +x build.sh" 
              sh('./build.sh')
          }
       }
    
       stage('push'){
         steps{
             script{
                 echo "pushing the application"
                 sh "chmod +x deploy.sh"
                 sh('./deploy.sh')       
             } 
         } 
                    
       } 
       stage('deploy'){
          steps{
             script {
                   def dockerCmd = 'docker run -itd --name My-first-container2 -p 80:80 jeevithals25/dev:latest'
                   sshagent(['sshkey']) {
                      sh "ssh -o StrictHostKeyChecking=no ubuntu@13.233.106.6 ${dockerCmd}"
                   }
             }
         }    
       }
    }
    post{
        success{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'jeevithals700@gmail.com'   

        }
    }   
    
}
