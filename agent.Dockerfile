FROM jenkins/inbound-agent:3283.v92c105e0f819-1-jdk17
USER root
RUN apt-get update && \
  apt-get install -y lsb-release --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && \
  apt-get install -y docker-ce-cli --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*
