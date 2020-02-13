FROM lachlanevenson/k8s-kubectl:v1.13.7

# Install bash and gettext
# gettext includes envsubst, used for variable expansion in config files
RUN apk add --update bash gettext openssh && rm -rf /var/cache/apk/*

# Download Rancher cli
RUN wget https://github.com/rancher/cli/releases/download/v2.0.6-rc3/rancher-linux-amd64-v2.0.6-rc3.tar.gz --no-check-certificate
# Unzip
RUN tar -xvzf rancher-linux-amd64-v2.0.6-rc3.tar.gz
# Make executable available
RUN ln -s /root/rancher-v2.0.6-rc3/rancher /usr/bin/rancher

ENTRYPOINT [ "/bin/bash", "-c" ]

CMD [ "rancher" ]
