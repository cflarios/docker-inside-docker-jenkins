FROM jenkins/jenkins:lts-alpine
USER root
RUN apk add --no-cache \
    ca-certificates \
    curl \
    gnupg \
    openssl \
    python3 \
    py3-pip
RUN apk add --no-cache \
    docker \
    docker-cli
RUN curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
RUN addgroup jenkins docker
USER jenkins
