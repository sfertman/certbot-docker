# Certbot with AWS DNS Plugin in Docker
Certbot installation process is more complicated that it need to be and I'm tired of spending half a day every time I spin up a server that needs https. Fortunately, this is not the case for Docker. This image comes pre loaded with [certbot-dns-route53](https://certbot-dns-route53.readthedocs.io/en/stable/) plugin, awscli and a bunch of other stuff that they need to work.

## How to

- [x] [Install Docker](https://docs.docker.com/get-docker/)

- [x] Clone this repo
```shell
$ git clone git@github.com:sfertman/certbot-docker
$ cd certbot-docker
```

- [x] Build
```shell
$ build.sh
```

- [x] AWS setup
- Create certbot user in IAM
- Create and attach a policy to allow dns challenge
- Create security credentials for this certbot IAM user
- Create AWS credentials file and write it to `~/.aws/credentials`
```ini
[default]
aws_access_key_id = YOURAWSACCESSKEYID
aws_secret_access_key = yourawssecretaccesskey
```
- Create AWS config file and write it to `~/.aws/config`:
```ini
[default]
region = us-east-1 # for example
```
- [x] Run
```
$ certbot.sh certonly [...args]
$ certbot.sh renew [...args]
```
This will:
- write logs to `~/letsencrypt/log/`
- save config in `~/letsencrypt/config/`
- store certificates in `~/letsencrypt/work/`
