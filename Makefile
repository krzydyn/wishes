install-kamatera:
	touch .lastinstall
	scp *.php kamatera:/var/www/html/wishes/
	scp -r templates/ kamatera:/var/www/html/wishes/
	scp -r css/ kamatera:/var/www/html/wishes/
