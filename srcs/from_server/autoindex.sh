STR=$(cat /etc/nginx/sites-available/nginx.conf)
SUB='autoindex on'
if [[ $STR == *$SUB* ]]
then
	# /то что написано в nginx/на что нужно заменить
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/nginx.conf
	echo "autoindex off"
else
	# /то что написано в nginx/на что нужно заменить
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/nginx.conf
	echo "autoindex on"
fi
service nginx restart