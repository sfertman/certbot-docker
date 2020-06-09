#!/bin/sh

docker run -it --rm \
  -v ~/.aws/:/usr/local/.aws/:ro \
  -v ~/letsencrypt/log/:/usr/local/letsencrypt/log/:rw \
  -v ~/letsencrypt/config/:/usr/local/letsencrypt/config/:rw \
  -v ~/letsencrypt/work/:/usr/local/letsencrypt/work/:rw \
  certbot "${@}"
