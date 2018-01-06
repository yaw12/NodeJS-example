#!/bin/bash
// An example to install npm needed for nodeJS to work

job('NodeJS-example') {

scm { 
  git('https://github.com/yaw12/NodeJS-example.git') { node -> // is hudson.plugins.git.GitSCM
      node / gitConfigName('Username')		 
      node / gitConfigEmail('email@address')
   }
}

triggers {
    scm('H/5 * * * *')
}

wrappers {
    nodejs('nodejsl') // this is the name of the NodeJS installation in 
	            // Manage Jenkins -> Configure Tools -> NodeJS Installation Name
}

steps {
    shell ("npm install")
      }
}
