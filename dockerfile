#!/bin/bash
// An example to install npm needed for nodeJS to work

job('NodeJS-example') {

scm { 
  git('https://github.com/yaw12/NodeJS-example.git') { node ->
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
    shell ("sudo apt install npm")
      }
}
