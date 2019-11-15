FROM alpine:3

ENV VERSION=0.10.0
ENV ARCH=amd64
ENV BASE_URL=https://github.com/kubermatic/kubeone/releases/download/v${VERSION}
ENV ZIP_FILE=kubeone_${VERSION}_linux_${ARCH}.zip

RUN apk add --update --no-cache python py-jinja2 py-yaml && \
    wget ${BASE_URL}/${ZIP_FILE} && \
    unzip ${ZIP_FILE} && \
    mv kubeone /usr/bin/kubeone && \
    chmod +x /usr/bin/kubeone && \
    rm -rf ${ZIP_FILE} && rm -rf examples && 
    rm -f /var/cache/apk/*

WORKDIR /apps
