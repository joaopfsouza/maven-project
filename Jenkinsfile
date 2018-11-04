pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '54.91.116.148', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '34.209.233.6', description: 'Production Server')
         string(name: 'myKey', defaultValue: 'C:/git/tomcat-demo.ppk', description: 'Staging Server SSH Key')
        string(name: 'pathWar', defaultValue: 'C:/Program Files (x86)/Jenkins/workspace/FullyAutomated/webapp/target/webapp.war', description: 'Path war')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        bat "pscp -i ${params.myKey} C:///"Program Files (x86)/"//Jenkins//workspace//FullyAutomated//webapp/target//webapp.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }

                //stage ("Deploy to Production"){
                  //  steps {
                    //    sh "pscp -i ${params.myKey} **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                   // }
                //}
            }
        }
    }
}
