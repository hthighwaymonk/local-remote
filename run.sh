#bin/bash

mkdir -p /mnt/zenstorage
sudo touch /var/log/rclone-zenstorage.log
sudo chown seed:seed /var/log/rclone-zenstorage.log

sudo systemctl disable zenunion.service
sudo systemctl stop zenunion.service
sudo rm /etc/systemd/system/zenunion.service
#sudo rm /etc/systemd/system/zenremote.service
#sudo rm /etc/systemd/system/zenremote_primer.service
#sudo rm /etc/systemd/system/zenremote_primer.timer
#sudo rm /etc/systemd/system/zenstorage.service
#sudo rm /etc/systemd/system/zenstorage_primer.service
#sudo rm /etc/systemd/system/zenstorage_primer.timer
#sudo rm /etc/systemd/system/mergerfs.service

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/mergerfs.service -P /etc/systemd/system/

sudo systemctl daemon-reload
sleep 1
sudo systemctl enable zenstorage.service && sudo systemctl restart zenstorage.service 
sudo systemctl enable mergerfs.service && sudo systemctl restart mergerfs.service 
sleep 1
#restart all dockers
docker restart $(docker ps -q)
