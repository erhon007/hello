FROM alpine
RUN apk add --udpate --no-cache curl wget busybox-extras netcat-openbsd python py-pip && pip install awscli
RUN apk --purge -v del py-pip
CMD tail -f /dev/null
