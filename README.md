# orchestration-a

## Instructions

1. Copy any new nginx config file to `/etc/nginx/conf.d/`
   - e.g. `sudo cp ./nginx-configs/robot-race-server.pux.one.conf /etc/nginx/conf.d`
2. `sudo nginx -s reload`
3. `sudo certbot --nginx`
   - Follow some instructions
4. (optional) Check with `systemctl list-timers`

## Individual Scripts

| Script        | Notes                              |
| ------------- | ---------------------------------- |
| nginx.sh      | Run with sudo. Copies nginx config |
| robot-race.sh | Starts Robot Race compose stack    |

## Useful Stuff

Find which ports are used:
```bash
ls /etc/nginx/conf.d | xargs cat | grep proxy_pass
```
