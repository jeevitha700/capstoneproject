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
                  def branch_nem = scm.branches[0].name
                    if (branch_nem.contains("*/")) {
                           branch_nem = branch_nem.split("\\*/")[1]
                           }
                                def branch = ${branch_nem}
                 sh('./deploy.sh')       
             } 
         } 
                    
       } 
       stage('deploy'){
          steps{
             echo "deploying the application"   
              
             def dockerCmd  = 'docker-compose down && docker-compose up -d'
              sshagent(['3.109.181.189']) {
                   sh "ssh -o StrictHostKeyChecking=no ubuntu@13.235.128.224 ${dockerCmd}"
            }
         }    
      }
    post{
        success{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'jeevithals700@gmail.com'   

        }
    }   
    
}
