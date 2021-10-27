# jenkins


https://learnku.com/articles/39601?spm=a2c6h.12873639.0.0.6a06b3062mJGH3

or 


https://developer.aliyun.com/article/742451

~~~

docker run -d --name jenkins -p 8081:8080 -v /data/jenkins_home:/var/jenkins_home jenkins/jenkins:lts;
备注：
-d //启动在后台
--name //容器名字
-p //端口映射（8081：宿主主机端口，8080：容器内部端口）
-v //数据卷挂载映射（/data/jenkins_home：宿主主机目录，另外一个即是容器目录）
enkins/jenkins:lts //Jenkins镜像（最新版）


server {
    listen       80;
    server_name  devops.local.com; # 改你的host
    #root /usr/apps/walle/web; # 根目录为web
    index index.php;

    # 建议放内网
    allow 192.168.252.0/24;
    deny all;

    location / {
        proxy_pass http://127.0.0.1:8081;
    }

}


在安装完成后，默认生成了一个登录密码，首次登录需要这个密码。
密码路径：var/jenkins_home/secrets/initialAdminPassword //容器内部
查找密码：
docker container ls //显示container id
docker exec -it jenkins_01 bash //进入jenkins容器, jenkins_01 修改为自己的 container id
cat /var/jenkins_home/secrets/initialAdminPassword //查看密码



~~~
