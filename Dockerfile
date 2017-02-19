FROM debian:jessie

RUN apt-get update ; \
	apt-get install -y python3 python3-pip git ; \
	pip3 install pip --upgrade ;

RUN pip3 install nameko pymongo pytest ; \
	cd /tmp ; \
	git clone https://github.com/saiqi/nameko-mongodb.git ; \
	cd ./nameko-mongodb ; \
	python3 setup.py install

ENTRYPOINT ["nameko","run"]
