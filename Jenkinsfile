pipeline {
  agent any
  stages {
	stage("Checkout") {
      steps {
        sh 'git clone https://github.com/gvsiva2008/K8s_gamukart.git '
	    sh 'cd K8s_gamukart'
      }
	}
	stage("build ") {
      steps {     
        sh 'mvn clean install'
      }
    }
    stage("Build Image") {
      steps {     
	sh 'whoami'      
        sh 'docker build -t gvsiva2008/gamukart:v.1 .'
      }
    }
    stage("pushtoHub") { 
        steps{
           withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
             sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
             sh 'docker push gvsiva2008/gamukart:v.1'
           }
        }
     }
     stage("Deploying App to Kubernetes") {
      steps {
        script {
          kubernetesDeploy(configs: "deployment.yaml", kubeconfigId: "k8s")
        }
      }
    }
  }
}	
