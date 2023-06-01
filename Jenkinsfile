pipeline {
     agent any
	 stages{
	     stage ('git checkout')
		 {
		     steps
			 {git branch: 'main', url: 'https://github.com/Munna7867/maven-web-application.git'
			 }
         }
		 stage ('Unit test')
		 {
		    steps{
			  sh 'mvn test'  
			 }
         }
		  stage ('integration testing')
		 {
		    steps{
			  sh 'mvn verify -DskipUnitTests'  
			 }
         }
	 }	 
	     
	 }	
