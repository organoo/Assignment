pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git credentialsId: '789c2ce4-103d-4361-9cbc-a4ead7403220', url: 'https://github.com/organoo/Assignment.git'
            }
        }
        stage('build image'){
            steps{
                  sh "docker build -t sowmyakandagadda/django:1.0.0 ."
            }
        }
        stage('login and push to dockerhub'){
            steps{
                withCredentials([string(credentialsId: '02ed4975-9dba-45bf-ac8a-8d06070f0f30', variable: 'password')])
                {
                   sh "docker login -u sowmyakandagadda -p ${password}"
                }
                   sh "docker push sowmyakandagadda/django:1.0.0"
            }
        }
        stage('connecting to docker server and running a container'){
            steps{
                     sh """
                          sshpass -p ubuntu ssh ubuntu@65.2.5.187  \
                          docker stop djangocontainer || true
                          docker rm -f djangocontainer || true 
                          docker logout
                          docker login -u sowmyakandagadda -p Kandagaddala@123
                          docker pull sowmyakandagadda/django:1.0.0
                          docker run -d -p 8000:8000 --name djangocontainer  -e EMAIL_USER=sowmyakbsss@gmail.com  -e EMAIL_PASS=Kbsss@123 sowmyakandagadda/django:1.0.0 
                          docker exec djangocontainer python manage.py makemigrations 
                          docker exec djangocontainer python manage.py migrate 
                          docker restart djangocontainer 
                        """
            }
        }
        
        
    }
}
