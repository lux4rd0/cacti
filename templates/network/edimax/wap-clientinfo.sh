#
# WAP Client Info Log File
#

LOG=/mnt/attic/logs/metrics

echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-basement > ${LOG}/wapclient-status-wapbasement.txt.tmp
mv ${LOG}/wapclient-status-wapbasement.txt.tmp ${LOG}/wapclient-status-wapbasement.txt

echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-office > ${LOG}/wapclient-status-wapoffice.txt.tmp
mv ${LOG}/wapclient-status-wapoffice.txt.tmp ${LOG}/wapclient-status-wapoffice.txt


echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-garage > ${LOG}/wapclient-status-wapgarage.txt.tmp
mv ${LOG}/wapclient-status-wapgarage.txt.tmp ${LOG}/wapclient-status-wapgarage.txt


echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-mb > ${LOG}/wapclient-status-wapmb.txt.tmp
mv ${LOG}/wapclient-status-wapmb.txt.tmp ${LOG}/wapclient-status-wapmb.txt


echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-lounge > ${LOG}/wapclient-status-waplounge.txt.tmp
mv ${LOG}/wapclient-status-waplounge.txt.tmp ${LOG}/wapclient-status-waplounge.txt


echo -ne "show status wlan 2.4g clients \n show status wlan 5g clients \n" | sshpass -p '$1' ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -o StrictHostKeyChecking=no admin@wap-loft > ${LOG}/wapclient-status-waploft.txt.tmp
mv ${LOG}/wapclient-status-waploft.txt.tmp ${LOG}/wapclient-status-waploft.txt
