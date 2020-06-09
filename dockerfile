FROM ubuntu:focal as installer
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository universe \
    && apt-get update \
    && apt-get -y install certbot

RUN apt-get install -y python3-certbot-dns-route53

RUN apt-get install -y curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip
RUN aws/install

FROM installer

ENV AWS_CONFIG_FILE=/usr/local/.aws/config
ENV AWS_SHARED_CREDENTIALS_FILE=/usr/local/.aws/credentials
VOLUME [ "/usr/local/.aws/" ]
VOLUME [ "/usr/local/letsencrypt/log/" ]
VOLUME [ "/usr/local/letsencrypt/config/" ]
VOLUME [ "/usr/local/letsencrypt/work/" ]
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
