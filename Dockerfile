FROM alpine:3

ENV VERSION=0.10.0
ENV ARCH=amd64
ENV BASE_URL=https://github.com/kubermatic/kubeone/releases/download
ENV ZIP_FILE=kubeone_${VERSION}_linux_${ARCH}.zip

RUN wget ${BASE_URL}/${ZIP_FILE} && \
    unzip ${ZIP_FILE} && \
    mv kubeone /usr/bin/kubeone && \
    chmod +x /usr/bin/kubeone && \
    rm -rf ${ZIP_FILE} && rm -rf examples

WORKDIR /apps

ENTRYPOINT ["kubeone"]
CMD ["--help"]