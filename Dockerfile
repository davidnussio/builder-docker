FROM jenkinsci/ssh-slave

RUN apt-get update && \
    apt-get install -y libltdl-dev && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd docker -g 999 && usermod -a -G docker jenkins