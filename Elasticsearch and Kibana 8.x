#####follow link:  https://www.youtube.com/watch?v=1GjR0YSFCFo



sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo dnf install -y java-11-amazon-corretto-devel
java -version


## U57h=dlVfcnd1_SBC6sp



curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic-archive-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch



cat /etc/apt/sources.list.d/elastic-7.x.list
deb [signed-by=/usr/share/keyrings/elastic-archive-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main
echo "deb [signed-by=/usr/share/keyrings/elastic-archive-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list



###############################Start Here ########################################

##Update package list:
sudo apt-get update
##Install OpenJDK 8:
sudo apt-get install -y openjdk-8-jdk

sudo apt-get update
##Install Nginx:
sudo apt-get -y install nginx

##Add Elasticsearch GPG key:
##wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

##Add Elasticsearch repository:
##echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
##sudo vim /etc/apt/sources.list.d/elastic-7.x.list
##edit

echo "deb [signed-by=/usr/share/keyrings/elastic-archive-keyring.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor | sudo tee /usr/share/keyrings/elastic-archive-keyring.gpg

##Update package list again:
sudo apt update


##Install Elasticsearch:
sudo apt install elasticsearch


#vim /etc/elasticsearch/elasticsearch.yml

#cluster.name: my-application
#node.name: node-1
#network.host: localhost
#http.port: 9200



# Define the file path
elasticsearch="/etc/elasticsearch/elasticsearch.yml"

# Append multiple lines to the file
sudo bash -c "cat >> $elasticsearch" <<EOL
cluster.name: my-application
node.name: node-1
network.host: localhost
http.port: 9200
EOL



##Install Kibana:
sudo apt install kibana


# Define the file path
kibana="/etc/kibana/kibana.yml"

# Append multiple lines to the file
sudo bash -c "cat >> \"$kibana\"" <<EOL
server.port: 5601
server.host: "localhost"
EOL

##Install Kibana:
sudo apt install logstash


##Install Filebeat:
sudo apt install filebeat

sudo systemctl start elasticsearch
sudo systemctl enable kibana
sudo systemctl start kibana
sudo systemctl enable logstash
sudo systemctl start logstash
sudo systemctl enable logstash
sudo systemctl start filebeat
sudo systemctl enable filebeat

sudo apt install apache2-utils -y

#sudo htpasswd -c /etc/nginx/.htpasswd kibana
sudo htpasswd -c /etc/nginx/htpasswd.users kibana
cat /etc/nginx/htpasswd.users



sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default-backup
##sudo vim /etc/nginx/sites-available/default


# Define the file path
default="/etc/nginx/sites-available/default"

# Append multiple lines to the file
sudo bash -c "cat >> \"$default\"" <<'EOL'
server {
    listen 80;

    # server_name <Instance Private IP>;
    server_name localhost;
    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOL


sudo systemctl enable nginx
sudo systemctl start nginx
sudo nginx -t



sudo systemctl restart nginx
sudo systemctl restart kibana


###  file beat command
sudo filebeat modules list
    sudo filebeat modules enable system


   55  sudo filebeat modules list
   56  sudo filebeat modules enable system
   57  sudo filebeat modules list
   58  sudo filebeat modules enable apache
   59  sudo filebeat modules list
sudo filebeat modules list  ### ab enable catagersi mai aa jayga vo 
vim /etc/filebeat/modules.d/system.yml ###
var.paths:["/var/log/syslog*"]

var.paths:["var/log/auth.log*"]
'
systemctl restart filebeat
