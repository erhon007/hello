sudo apt update
sudo apt install nginx

sudo ufw app list

sudo ufw allow 'Nginx HTTP'

$ cat <<EOF > /etc/nginx/sites-enabled/http
server
    {
        listen 80 default_server;

        location / {
            proxy_pass http://192.168.10.161:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header X-Real-IP $remote_addr;
            }


    }
EOF

$ cat <<EOF > /etc/nginx/sites-enabled/https
server
    {
        listen 443 default_server;

        location / {
            proxy_pass http://192.168.10.161:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header X-Real-IP $remote_addr;
            }


    }
EOF

sudo systemctl restart nginx.service