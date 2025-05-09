docker compose up -d
sleep 3
docker compose exec -it cups cupsctl 'DefaultEncryption=IfRequested'
docker compose exec -it cups cupsctl 'ServerAlias=*'
docker compose exec -it cups cupsctl
