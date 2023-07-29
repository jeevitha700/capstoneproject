pipeline{
    agent any
    environment{
       DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    stages{
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
                    echo  BRANCH=${branch_nem}
                 sh('./deploy.sh')       
             } 
         } 
                    
       } 
       stage('deploy'){
          steps{
             echo "deploying the application"
             sh 'docker-compose down && docker-compose up -d'
            
          }
       }    
    }
    post{
        success{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'jeevithals700@gmail.com'   

        }
    }   
    
}
