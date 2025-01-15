install-kamatera:
	tar czf wishes.tgz *.php templates css
	scp wishes.tgz kamatera:
	ssh kamatera tar xzf ./wishes.tgz --recursive-unlink -C /var/www/html/wishes/
