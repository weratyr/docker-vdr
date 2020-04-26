# Dockerized VDR

## Docker build 

docker build -t weratyr/vdr .

docker volume create vdr_config
docker volume create vdr_lib_config
docker volume create vdr_recordings

## Docker run 

docker run  --privileged \
	   -v vdr_config:/etc/vdr \
	   -v vdr_lib_config:/var/lib/vdr \ 
	   -v vdr_recordings:/var/lib/video \ 
	   --device /dev/dvb:/dev/dvb \ 
	   --net=host --name vdr -d weratyr/vdr:latest
