# Dockerized VDR

## git clone 
```bash 
git clone https://github.com/weratyr/vdr.git && cd vdr
```

## Docker build 
This will build the docker vdr image which is based on a debian bullseye image from docker hub.
```bash
docker build -t weratyr/vdr .
```

## Docker volume
There are three volumes needed for exposing all config files of the VDR. 
```bash
docker volume create vdr_config
docker volume create vdr_lib_config
docker volume create vdr_recordings
```

## Docker run 
```bash
docker run  --privileged \
	   -v vdr_config:/etc/vdr \
	   -v vdr_lib_config:/var/lib/vdr \ 
	   -v vdr_recordings:/var/lib/video \ 
	   --device /dev/dvb:/dev/dvb \ 
	   --net=host \
	   --name vdr \ 
	   -d weratyr/vdr:latest
```

## Installed plugins 

There are three VDR plugins included: 
-  streamdev-server 
	- You have to adjust the `streamdevhosts.conf` for you local subnet, after that you should be able to connect to port http://servername:3000
-  plugin-epgsearch 
-  live
	- There is no custom config done during the installation, so if you access http://servername:8008, you should be able to login with `admin` as user and `live` as password. 

