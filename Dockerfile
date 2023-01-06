FROM jenkins/jenkins:lts-alpine
USER root
# Install Docker and Docker Compose
RUN set -ex && \
    apk add --no-cache \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apk update && \
    apk add --no-cache --no-install-recommends docker-ce && \
    curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apk add --no-cache docker-ce-cli containerd.io
# Add the jenkins user to the docker group
RUN usermod -aG docker jenkins
USER jenkins
