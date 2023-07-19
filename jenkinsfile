pipeline{
    agent {label 'linux'}
    stages{
        stage( 'build'){
          steps{
              echo "building the application"
              sh('./build.sh')
          }
       }  
       stage ('test'){
         steps{
             echo "testing the application"
             sh 'docker run -d -p 80:80 $IMAGENAME'
         } 
       } 
       stage ('deploy'){
          steps{
             echo "deploying the appliction"
             sh('./deploy.sh')
          }
       }    
    }
    post{
        sucess{

             emailext body: '  successfully completed my capstone project', subject: 'successfully build', to: 'jeevithals700@gmail.com'   

        }
    }   
    
}
