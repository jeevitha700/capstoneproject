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
       stage ('push'){
         steps{
             echo "push the application"
             sh "chmod +x ./deploy1.sh"
             sh('./deploy1.sh')
             
         } 
       } 
       stage ('deploy'){
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
