upstream fastcgi_backend {
    # use tcp connection
    server  127.0.0.1:9000;
    # or socket
    # server   unix:/var/run/php5-fpm.sock;
}

server {
    listen 80 default;
    server_name mage2.dev;
    set $MAGE_ROOT /vagrant/magento2;
    set $MAGE_MODE developer;
    include /vagrant/magento2/nginx.conf.sample;
}
