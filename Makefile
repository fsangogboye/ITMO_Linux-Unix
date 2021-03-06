install: Time-fi.mo
	install TimeTxt Main /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat TimeTxt.services`" /etc/services || cat TimeTxt.services >> /etc/services
	install TimeTxt.xinetd /etc/xinetd.d/TimeTxt
	ln -sf /usr/local/bin/Main /usr/local/bin/nMain
	install Time-fi.mo /usr/share/locale/fi/LC_MESSAGES/Main.mo

Main.pot: Main
	xgettext -o Main.pot -L Shell Main

Time-fi.mo: Time-fi.po
	msgfmt -o Time-fi.mo Time-fi.po

clone:
	git clone https://github.com/filshadz/ITMO_Linux-Unix.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags

