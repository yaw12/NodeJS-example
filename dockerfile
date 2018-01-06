#!/bin/bash
# An example to install npm needed for nodeJS to work

job('NodeJS example') {

scm { 
  git('git://github.com/wardviaene/docker-demo.git') { node ->
      node / gitConfigName('Username')		 
      node / gitConfigEmail('email@address')
   }
}

triggers {
    scm('H/5 * * * *')
}

wrappers {
    nodejs('nodejs') // this is the name of the NodeJS installation in 
	            // Manage Jenkins -> Configure Tools -> NodeJS Installation Name
}

steps {
    shell ("npm install")
      }
}
