FROM jenkins/jenkins:latest

ENV JENKINS_JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/

USER root

RUN apt-get -y update
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
RUN apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
RUN apt-get -y update
RUN apt-get -y install docker-ce
RUN apt-get -y install kubectl
RUN usermod -aG docker jenkins

USER jenkins

COPY --chmod=555 link-project.sh /var/jenkins_home/link-project.sh

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt