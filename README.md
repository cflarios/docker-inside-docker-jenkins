# Custom docker image for jenkins

Do you need running Docker in a Jenkins Container?

Well, this image is for a jenkins container with docker inside (docker-compose as well), for those projects with docker.

**NOTE**: Although docker-compose version 1.28.3 is specified, version 1.25.3 is installed. At the moment the only solution 
I have is to perform the following command inside the Jenkins container:

```
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
By the way, if you don't remember how to enter the container command line, you can do it like this:

```
docker-compose exec jenkins bash
```
