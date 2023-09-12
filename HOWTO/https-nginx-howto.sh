https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

sudo nano /etc/nginx/snippets/self-signed.conf

ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;


sudo nano /etc/nginx/snippets/ssl-params.conf

ssl_protocols TLSv1.3;
ssl_prefer_server_ciphers on;
#ssl_dhparam /etc/nginx/dhparam.pem; 
ssl_ciphers EECDH+AESGCM:EDH+AESGCM;
ssl_ecdh_curve secp384r1;
ssl_session_timeout  10m;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off;
ssl_stapling on;
ssl_stapling_verify on;
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;
# Disable strict transport security for now. You can uncomment the following
# line if you understand the implications.
#add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";


openssl dhparam -dsaparam -out /etc/ssl/private/dhparam.pem 4096


sudo nano /etc/nginx/sites-available/m2paypad.conf

server {
        listen 443 ssl;
        listen [::]:443 ssl;

        include snippets/self-signed.conf;
        include snippets/ssl-params.conf;

        access_log /var/log/nginx/m2paypad.access.log;
        error_log /var/log/nginx/m2paypad.error.log;

        location / {
                include proxy_params;
                proxy_pass http://unix:/var/www/m2-kiosk-web/m2paypad.sock;
        }
}

server {
        listen 80;
        return 301 https://$host$request_uri;   
}

