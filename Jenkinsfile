pipeline{
    agent any
    stages{
        stage( 'build'){
          steps{
              echo "building the application"
              sh "chmod +x ./build.sh" 
              sh('./build.sh')
          }
       }  
       stage ('test'){
         steps{
             echo "testing the application"

             sh 'docker-compose down && docker-compose up -d'
         } 
       } 
       stage ('deploy'){
          steps{
             echo "deploying the application"
             sh "chmod +x ./deploy.sh"
             sh('./deploy.sh')
          }
       }    
    }
    post{
        success{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'jeevithals700@gmail.com'   

        }
    }   
    
}
