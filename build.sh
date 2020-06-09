#!/bin/sh

docker build -t certbot:latest --cache-from certbot:deps .