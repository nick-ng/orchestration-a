# orchestration-a

## Instructions

- Copy any new nginx config file to `/etc/nginx/conf.d/`
  - e.g. `sudo cp ./nginx-configs/robot-race-server.pux.one.conf /etc/nginx/conf.d`
- `sudo nginx -s reload`
- `sudo certbot --nginx`
  - Follow some instructions
- (optional) Check with `systemctl list-timers`

## Individual Scripts

| Script        | Notes                              |
| ------------- | ---------------------------------- |
| nginx.sh      | Run with sudo. Copies nginx config |
| robot-race.sh | Starts Robot Race compose stack    |
