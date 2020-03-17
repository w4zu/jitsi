#jitsi
#Root requiered
# change varible website before run this script 
#https://github.com/jitsi/jitsi-meet/blob/master/doc/quick-install.md
# VARIABLE TO CHANGE 
website=jisti.youdomain.com # use the same during installation of jisti
# DO NOT TOUCH AFTER THIS LINE
echo 'deb https://download.jitsi.org stable/' >> /etc/apt/sources.list.d/jitsi-stable.list
wget -qO -  https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -
apt-get update
echo "During the installation, you will be asked to enter the hostname of the Jitsi Meet instance. If you have a FQDN hostname for the instance already set up in DNS, enter it there. If you don't have a resolvable hostname, you can enter the IP address of the machine (if it is static or doesn't change)."
echo "This hostname will be used for virtualhost configuration inside the Jitsi Meet and also, you and your correspondents will be using it to access the web conferences."
sleep 10
apt-get -y install jitsi-meet
echo "Generate a let's encrypt certificat if you want : /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh or certbot -d $website --no-eff-email --no-redirect"
a2ensite $website
/etc/init.d/apache2 reload; systemctl reload apache2
echo "go to http://$website
