# Notes

A place to store tidbits of information so I don't lose them.

# What's my IP?

Set crontab `1 3 * * * python3 aiopilog.py` with `aiopilog.py`

```
import socket
import uuid
from secrets import secrets
from Adafruit_IO import Client, Feed, RequestError

def get_ip():
   s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
   try:
     s.connect(('196.168.0.1',1))
     IP = s.getsockname()[0]
   except Exception:
     IP = '127.0.0.1'
   finally:
     s.close()
   return IP

 aio = Client(secrets['AIOUSER'], secrets['AIOKEY'])
 feed = aio.feeds('mypis')
 aio.send(feed.key, "{} is at {}".format(socket.gethostname(), get_ip()))
```

# CIFS mount not mounted?

See [this solution](https://raspberrypi.stackexchange.com/q/34444)

# Samba

1. Install with `sudo apt install samba samba-common-bin`
2. add a user space to `/etc/samba/smb.conf`, e.g.

```
[PiUser]
path = /home/pi
browseable = yes
read only = no
```

3. Create a password with `sudo smbpasswd -a pi`
4. Enable user with `sudo smbpasswd -e pi`
5. Restart with `sudo systemctl restart smbd`
