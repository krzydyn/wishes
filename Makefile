install-kamatera:
	scp *.php kamatera:/var/www/html/wishes/
	scp -r templates/ kamatera:/var/www/html/wishes/
	scp -r css/ kamatera:/var/www/html/wishes/
