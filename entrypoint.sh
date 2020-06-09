#!/bin/bash
ARGS=("${@}")

certbot "${ARGS[*]:0:1}" \
  --agree-tos \
  --non-interactive \
  --logs-dir    /usr/local/letsencrypt/log/ \
  --config-dir  /usr/local/letsencrypt/config/ \
  --work-dir    /usr/local/letsencrypt/work/ \
  --server https://acme-v02.api.letsencrypt.org/directory \
  "${ARGS[*]:1}"
