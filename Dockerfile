FROM mini/base

ARG AWSCLI_VERSION=1.11.105

RUN apk-install \
    less \
    groff \
    python3 \
  && pip3 install --no-cache-dir --upgrade \
    awscli==$AWSCLI_VERSION \
  && adduser -D aws

USER aws

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["aws"]
CMD ["help"]
