yum remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine 
    &&
    yum install -y yum-utils \
        device-mapper-persistent-data
        lvm2
        
        &&
        yum-config-manager \
           --add-repo \
           https://download.docker.com/linux/centos/docker-ce.repo

&&
dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
&&
yum install docker-ce docker-ce-cli containerd.io
&&
systemctl start docker
&&
docker pull jenkins/jenkins:lts
&&
mkdir /data/jenkins_home
&&
chown -R 1000:1000 /data/jenkins_home
&&
docker run -d --name jenkins -p 8081:8080 -v /data/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
