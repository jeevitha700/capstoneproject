pipeline{
    agent any
    environment{
       DOCKERHUB_CREDENTIALS = credentials('dockerhub')
       FULL_PATH_BRANCH = "${sh(script:'git name-rev --name-only HEAD', returnStdout: true)}"
       GIT_BRANCH = FULL_PATH_BRANCH.substring(FULL_PATH_BRANCH.lastIndexOf('/') + 1, FULL_PATH_BRANCH.length())
  }
    }
    stages{
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
                  echo "$branch=env.GIT_BRANCH"
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
