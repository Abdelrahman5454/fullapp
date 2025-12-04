ls
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
reboot
sudo dnf -y install yum-utils
ls
docker pull mongo-express
sudo dnf -y install yum-utils
 18165:20251109:061300.567 thread started
 18166:20251109:061300.567 thread started
 18134:20251109:061300.589 thread started [discovery worker #1]
 18134:20251109:061300.589 thread started [discovery worker #2]
 18134:20251109:061300.589 thread started [discovery worker #3]
 18134:20251109:061300.589 thread started [discovery worker #4]
 18134:20251109:061300.589 thread started [discovery worker #5]
 18165:20251109:061304.567 resuming Zabbix agent checks on host "Zabbix server": connection restored
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
docker --version
docker run hello
jobs
docker pull redis
docker run -d redis
docker ps
docker ps -a
docker logs peaceful_mestorf
docker ps -a
env
docker pull mongo
docker create mongo-network
docker network create mongo-network
docker ps
$ docker run -it --rm     --network web_default     --name mongo-express     -p 8081:8081     -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"     -e ME_CONFIG_MONGODB_SERVER="web_db_1"     -e ME_CONFIG_BASICAUTH_USERNAME="user"     -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"     mongo-express
yum install bash
$ docker run -it --rm     --network web_default     --name mongo-express     -p 8081:8081     -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"     -e ME_CONFIG_MONGODB_SERVER="web_db_1"     -e ME_CONFIG_BASICAUTH_USERNAME="user"     -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"     mongo-express
docker run -it --rm     --network web_default     --name mongo-express     -p 8081:8081     -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"     -e ME_CONFIG_MONGODB_SERVER="web_db_1"     -e ME_CONFIG_BASICAUTH_USERNAME="user"     -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"     mongo-express
docker run -it --rm     --network mongo-network     --name mongo-express     -p 8081:8081     -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"     -e ME_CONFIG_MONGODB_SERVER="web_db_1"     -e ME_CONFIG_BASICAUTH_USERNAME="user"     -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"     mongo-express
docker ps
--network mongo-network
docker network inspect mongo-network
docker network ls
docker run -it --rm   --network mongo-network   --name mongo-express   -p 8081:8081   -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"   -e ME_CONFIG_MONGODB_SERVER="mongo"   -e ME_CONFIG_BASICAUTH_USERNAME="user"   -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"   mongo-express
docker ps
docker ps -a
docker ps
docker run -d   --name mongo   --network mongo-network   -p 27017:27017   -e MONGO_INITDB_ROOT_USERNAME=root   -e MONGO_INITDB_ROOT_PASSWORD=password   mongo:latest
docker run -it --rm   --network mongo-network   --name mongo-express   -p 8081:8081   -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"   -e ME_CONFIG_MONGODB_SERVER="mongo"   -e ME_CONFIG_MONGODB_ADMINUSERNAME="root"   -e ME_CONFIG_MONGODB_ADMINPASSWORD="password"   -e ME_CONFIG_BASICAUTH_USERNAME="user"   -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"   mongo-express
ps a
docker ps
docker ps -a
clear
docker run -it --rm   --network mongo-network   --name mongo-express   -p 8081:8081   -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"   -e ME_CONFIG_MONGODB_SERVER="mongo"   -e ME_CONFIG_MONGODB_ADMINUSERNAME="root"   -e ME_CONFIG_MONGODB_ADMINPASSWORD="password"   -e ME_CONFIG_BASICAUTH_USERNAME="user"   -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"   mongo-express
docker run -d   --network mongo-network   --name mongo-express   -p 8081:8081   -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance"   -e ME_CONFIG_MONGODB_SERVER="mongo"   -e ME_CONFIG_MONGODB_ADMINUSERNAME="root"   -e ME_CONFIG_MONGODB_ADMINPASSWORD="password"   -e ME_CONFIG_BASICAUTH_USERNAME="user"   -e ME_CONFIG_BASICAUTH_PASSWORD="fairly long password"   mongo-express
docker ps
shutdown now
touch docker-compose.yml
ls
vi docker-compose.yml 
docker ps
docker ps -a
vi docker-compose.yml 
ls
docker compose up -d
docker rm -f mongo-express mongo
docker compose up -d
docke rps
docker rps
docker ps
docker logs mongo-express
clear
ls
vi docker-compose.yml 
ls
vi docker-compose.yml 
docker compose down
vi docker-compose.yml 
docker compose down
vi docker-compose.yml 
docker compose down
docker compose up -d
docker compose down -v
docker compose up -d
docker ps
ls volumes
ls volume
docker compose down
docker compose up -d
vi docker-compose.yml 
docker compose down
vi docker-compose.yml 
docker compose down
docker compose up -d
docker ps
mkdir -p ./nginx/html
ls
cd nginx/
ls
vi html/
cd html/
ls
touch index.html
ls
vi in
vi index.html 
docker compose restart nginx
docker ps
docker logs nginnx
docker logs ngin4x
docker logs nginx
cd
view docker-compose.yml 
vi docker-compose.yml 
docker compose down
docker compose up -d
docker ps
vi docker-compose.yml 
ls
cd nginx/
ls
cd
mkdir -p ~/fullstack-app/app
cd ~/fullstack-app/app
cat > package.json <<EOL
{
  "name": "fullstack-app",
  "version": "1.0.0",
  "main": "index.js",
  "dependencies": {
    "express": "^4.18.2",
    "mongodb": "^5.7.0",
    "redis": "^4.9.0"
  }
}
EOL

ls
cat > index.js <<EOL
const express = require('express');
const { MongoClient } = require('mongodb');
const redis = require('redis');

const app = express();
const PORT = 3000;

const mongoUrl = 'mongodb://root:password@mongo:27017';
const mongoClient = new MongoClient(mongoUrl);

const redisClient = redis.createClient({ url: 'redis://redis:6379' });
redisClient.connect();

app.get('/', async (req, res) => {
    try {
        const cache = await redisClient.get('welcome');
        if (cache) return res.send(\`From Redis: \${cache}\`);

        await mongoClient.connect();
        const db = mongoClient.db('testdb');
        const col = db.collection('messages');

        await col.insertOne({ message: 'Hello from MongoDB' });
        const doc = await col.findOne({});
        const msg = doc.message;

        await redisClient.setEx('welcome', 10, msg);

        res.send(\`From MongoDB: \${msg}\`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error');
    }
});

app.listen(PORT, () => console.log(\`Node app running on port \${PORT}\`));
EOL

ls
cd ..
ls
mkdir nginx
touch default.conf
ls
rm -rf default.conf 
ls
cd nginx/
ls
touch default.conf
ls
vi default.conf 
ls
vi default.conf 
cd ..
ls
touch docker-compose.yml
ls
vi docker-compose.yml 
ls
docker compose up -d --build
cd app/
ls
nano Dockerfile
vi Dockerfile
ls
cd /root/fullstack-app
docker compose up -d --build
ls
cd app/
ls
vi package.json 
cd ..
docker compose build --no-cache node-app
vi docker-compose.yml 
cd app/
ls
vi package.json 
cd ..
ls
vi docker-compose.yml 
ls
cd app/
ls
vi index.js 
cd ..
docker compose up -d --build
vi docker-compose.yml 
docker compose up -d --build
ls
cd app/
ls
vi p
vi package.json 
cd /root/fullstack-app
docker compose build --no-cache node-app
docker compose up -d
cd
docker ps
docker rm -f mongo-express
docker rm -f mongo
docker rm -f node-app
docker rm -f nginx
docker ps
cd fullstack-app/
ls
docker compose up -d --build
ping google.com
docker compose build --no-cache node-app
docker compose up -d
docker logs -f node-app
docker logs -f nginx
docker logs -f mongo
docker logs -f mongo-express
ls
vi docker-compose.yml 
docker volume ls
docker compose stop mongo
docker rm mongo
docker compose up -d mongo
ls
cd ap
cd app/
ls
view Dockerfile 
view Dockerfile index.js 
view index.js 
ls
cd 
ls
cd fullstack-app/
ls
vi docker-compose.yml 
sudo yum install zabbix-agent2 -y
sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.2/rhel/8/x86_64/zabbix-release-7.2-1.el8.noarch.rpm
ping google.com
sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.4/stable/rhel/8/x86_64/zabbix-release-7.4-1.el8.noarch.rpm
sudo dnf install zabbix-agent2
sudo subscription-manager status
sudo subscription-manager list --available
sudo subscription-manager attach --auto
sudo subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
sudo subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
sudo subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms
sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.4/stable/rhel/8/x86_64/zabbix-release-7.4-1.el8.noarch.rpm
curl -O https://repo.zabbix.com/zabbix/7.4/rhel/8/x86_64/zabbix-agent2-7.4.0-1.el8.x86_64.rpm
sudo dnf install ./zabbix-agent2-7.4.0-1.el8.x86_64.rpm
sudo dnf install zabbix-agent
sudo systemctl enable --now zabbix-agent
sudo yum install zabbix-agent
cd
sudo yum install zabbix-agent
curl -O https://repo.zabbix.com/zabbix/7.2/release/rhel/8/x86_64/zabbix-agent2-7.2.0-1.el8.x86_64.rpm
sudo dnf install ./zabbix-agent2-7.2.0-1.el8.x86_64.rpm
ls
cd fullstack-app/
ls
docker compose down
reboot
docker compose up -d
sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.2/release/rhel/8/noarch/zabbix-release-7.2-1.el8.noarch.rpm
sudo dnf clean all
sudo dnf makecache
sudo dnf install zabbix-agent2
sudo systemctl enable --now zabbix-agent2
sudo dnf install zabbix-agent2
sudo systemctl enable --now zabbix-agent2
sudo systemctl status zabbix-agent2
sudo systemctl enable --now zabbix-agent2
docker ps
# Make sure the container zabbix-agent2 is running
docker ps | grep zabbix-agent2
sudo firewall-cmd --add-port=10050/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart zabbix-agent2
vi /etc/zabbix/zabbix_agent2.conf
sudo systemctl restart zabbix-agent2
vi /etc/zabbix/zabbix_agent2.conf
docker compose down
shutdown now
reboot
ls
cd fullstack-app/
ls
docker compose up -d
ls
cd ..
ls
tar -cvzf fullstack-app/
tar -cvzf fullstack-app.tar.gz fullstack-app
ls
github
dnf install git -y
ls
docker compose down
cd fullstack-app
docker compose down
shutdown now
docker
docker ps
ls
cd fullstack-app
ls
view docker-compose.yml 
git init
git add .
git commit -m "Initial commit: fullstack Docker setup with Node, Mongo, Mongo Express, Nginx"
git status
git config --global user.name "Abdelrahman5454"
git config --global user.email "abdelrahman.mosaad@taly.com.eg"
git branch -M main
git remote add origin https://github.com/yourusername/fullstack-app.git
git push -u origin main
git remote set-url origin https://github.com/Abdelrahman5454/fullstack-app.git
git push -u origin main
git remote add origin https://github.com/Abdelrahman5454/fullstack-app.git
git remote set-url origin https://github.com/Abdelrahman5454/fullstack-app.git
git push -u origin main
docker ps
shutdown now
ls
cd fullstack-app
ls
docker compose up -d
docekr compose down
docker compose down
docker compose down 
docker rm -f postgres
docker ps
docker volume rm fullstack-app_pg-data
docker volume create fullstack-app_pg-data
vi docker-compose.yml 
shutdown now
top
clear
ls
ca /etc/os-release 
cat /etc/os-release 
id free -h
free -h
iotop -o
journalctl -u docker-compose.yml 
journalctl -f
ss -tuln
ss -tun
ls
Nov 20 05:06:34 localhost.localdomain dnf[3865]: This system is registered with an entitlement server, but is not receiving updates. You can use subscription-manager to assign subscriptions.
shutdown now
docker ps
ls
cd fullstack-app
docker compose up -d
ls
docker ps
docker login
sudo yum update -y ca-certificates
sudo update-ca-trust force-enable
sudo update-ca-trust extract
sudo yum update -y ca-certificates
sudo update-ca-trust force-enable
sudo update-ca-trust extract
shutdown now
cd /home/runner/actions-runner/bin/
./installdependencies.sh 
exit
/etc/sudoers
cd /etc/sudoers
cd /etc/
ls sudoers
vi sudoers
cd /etc/passwd
vi /etc/passwd
ls
sudo cp -r /root/fullstack-app /home/runner/
sudo chown -R runner:runner /home/runner/fullstack-app
sudo usermod -aG docker runner
groups runner
ls -l /var/run/docker.sock
docker ps
docker pull abdo02/fullstack-app:latest
sudo usermod -aG docker runner
cd /home/runner/actions-runner
sudo ./svc.sh stop
sudo ./svc.sh start
sudo su - runner
firewall-cmd --list-all
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all   # verify
curl http://<server-ip>:3000
curl http://192.168.124.132:3000
sudo ss -tulpn | grep 3000
sudo firewall-cmd --list-all
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all   # verify port 3000 is open
docker ps
ip a
cd
ls
cd fullstack-app
ls
cd docker-compose.yml 
ls
vi docker-compose.yml 
docker build -t abdo02/fullstack-app:dev .
docker push abdo02/fullstack-app:dev
cd app/
docker build -t abdo02/fullstack-app:dev .
docker push abdo02/fullstack-app:dev
git push origin dev
git checkout dev
sudo su - runner
shutdown 
docker ps
docker login
ls
cd fullstack-app
ls
docker push abdo02/fullstack-app:latest 
docker images
l
ls
cd app/
ls
vi Dockerfile 
jobs
bg
ls
fg %1
jobs
ls
vi Dockerfile 
ls
cd ..
ls
cp docker-compose.yml docker-compose2.yml
ls
vi docker-compose
vi docker-compose.yml 
bg %1
ls
fg %1
# Build the app (uses optimized Dockerfile)
docker-compose build
# Start the app (detached mode)
docker-compose up -d
# Optional: check logs
docker-compose logs -f node-app
docker images
docker build -t fullstack-app-node-app:latest .
ls
cd app/
ls
cd fullstack-app/app
docker build -t fullstack-app-node-app:latest .
[
docker images
ls
docker tag fullstack-app-node-app:latest fullstack-app:latest
ls
docker im
docker images
docker push abdo02/fullstack-app:latest
docker push abdo02/fullstack-app-node-app:latest
docker push abdo02/fullstack-app:latest
docker tag fullstack-app:latest abdo02/fullstack-app:latest
docker push abdo02/fullstack-app:latest
docker images
ls
docker --version
git --version
git init
git add .
git commit -m "Initial commit of new project"
git remote add origin https://github.com/Abdelrahman5454/Node-app.git
git remote -v
git branch -M main
git push -u origin main
git branch -M main
git push -u origin main
git branch -M main
git push -u origin main
git branch -M main
git push -u origin main
git branch -M main
git push -u origin main
cd
ls
cd fullstack-app
ls
git branch -M main
git push -u origin main
git branch -M main
ls
git add .
git commit -m "Add fullstack-app files"
git push -u origin main --force
git status
git log --oneline
git remote remove origin
git remote add origin https://github.com/Abdelrahman5454/Node-app.git
git branch -M main
git push -u origin main
git push -u origin main --force
ls
cd
useradd runner
sudo su - runner
ls
docker ps
ls
.
ls
cd
shutdown now
docker ps
curl -I https://github.com
cat /etc/resolv.conf 
docker ps
sudo firewall-cmd --state
sudo firewall-cmd --permanent --add-port=9090/tcp
sudo firewall-cmd --reload
docker ps
ls
docker system prune
df -h
docker system prune
df -h
ls
cd docker-compose.yml 
ls
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y terraform
terraform -version
ls
mkdir terraform-docker
cd terraform-docker
ls
vi main.tf
terraform init
terraform init -upgrade
fg %1
date
sudo timedatectl set-ntp true
sudo timedatectl set-timezone Africa/Cairo
date
terraform init
terraform plan
terraform apply -auto-approve
external = 9090
vi main.tf 
terraform apply -auto-approve
vi main.tf 
terraform apply -auto-approve
cd
rm -rf terraform-docker/
mkdir terraform-docker
cd terraform-docker/
ls
vi main.tf
ls
terraform apply -auto-approve
terraform plan
terraform inint
terraform init
terraform plan
date
curl -I https://github.com
sudo update-ca-trust
sudo update-ca-trust enable
terraform init
reboot
cd terraform-docker/
ls
terraform init
terraform plan
terraform apply -auto-approve
ls
https://github.com/kreuzwerker/terraform-provider-docker/releases/tag/v3.0.2
wget https://github.com/kreuzwerker/terraform-provider-docker/releases/tag/v3.0.2
curl https://github.com/kreuzwerker/terraform-provider-docker/releases/tag/v3.0.2
terraform --version
cd ..
mkdir terraform-docker2
cd terraform-docker2
ls
vi main.tf
terraform init
terraform plan
pwd
vi main.tf 
terraform plan
terraform init
terraform plan
vi main.tf 
terraform init
terraform plan
terraform apply -auto-approve
ls
docker ps
ls
docker ps
ls
terraform plam
terraform plan
terraform apply -auto-approve
ls
terraform plan
terraform apply -auto-approve
terraform plan
terraform apply -auto-approve
vi main.tf 
vi m
vi main.tf 
terraform plan
terraform apply -auto-approve
vi main.tf 
terraform plan
terraform apply -auto-approve
terraform plan
terraform apply -auto-approve
sudo su -aG docker root
sudo usermod -aG docker root
docker ps
docker stop 6b3f6f17ca8e
docker remove 6b3f6f17ca8e
docker ps
terraform plan
terraform apply -auto-approve
rm -rf .terraform
terraform init
terraform plan
terraform apply -auto-approve
terraform plan
terraform apply -auto-approve
[root@localhost terraform-docker2]#
terraform plan
terraform apply -auto-approve
│ Error: process "/bin/sh -c npm install --production" did not complete successfully: exit code: 254
│
│   with docker_image.node_app,
│   on main.tf line 39, in resource "docker_image" "node_app":
│   39: resource "docker_image" "node_app" {
│ Error: process "/bin/sh -c npm install --production" did not complete successfully: exit code: 254
│
│   with docker_image.node_app,
│   on main.tf line 39, in resource "docker_image" "node_app":
│   39: resource "docker_image" "node_app" {
│ Error: process "/bin/sh -c npm install --production" did not complete successfully: exit code: 254
│
│   with docker_image.node_app,
│   on main.tf line 39, in resource "docker_image" "node_app":
│   39: resource "docker_image" "node_app" {
docker ps
docekr stop 70f7a6a0c4d9
dockerr stop 70f7a6a0c4d9
docker stop 70f7a6a0c4d9
docker rm 70f7a6a0c4d9
ls
cd fullstack-app
ls
app
cd app
ls
cp -r Dockerfile ,,/
cp -r Dockerfile ,,
cd ..
ls
;s
ls
cd app/
;s
ls
cp -r Dockerfile /root/fullstack-app
ls
cd ..
ls
cd ..
ls
cd fullstack-app
ls
vi Dockerfile 
ls
cd ..
ls
view terraform-docker2
cd terraform-docker2
view terraform-docker2
view main.tf 
ls
cd 
ls
cd fullstack-app
ls
view Dockerfile 
docker info
docker ps
docker ps -q | xargs docker stop
docker system prune -f
docker version
sestatus 
sudo setenforce 0
sestatus 
rm -rf .terraform
terraform init
terraform plan
terraform apply -auto-approve
shutdown
