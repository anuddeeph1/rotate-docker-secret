# rotate-docker-secret

### This Script will help you to delete and create the docker secret which are mentioned in namespaces.txt

#### Steps:
1. Clone/Download Script from repo.\
    `git clone https://github.com/anuddeeph1/rotate-docker-secret.git `
2.  navigate to container_runtime_upgrade_script folder\
    `cd rotate-docker-secret`
3.  add excute permission to script.\
    `chmod +x script.sh`
4.  run the script.
        `./script.sh <secret-name> <namespaces-file>`
        `./script.sh regcred namespaces.txt`


