# Build a docker image for stunnel

FROM alpine:latest

LABEL maintainer "nkapashi"

#ENV

WORKDIR /

# 1. install stunnel
RUN apk --update --no-cache add \
	stunnel && \
apk --update --no-cache add \
	dante-server --repository  http://dl-3.alpinelinux.org/alpine/edge/testing --allow-untrusted && \

# 2. create needed directories and set owership
	mkdir run/stunnel && chown stunnel:stunnel run/stunnel 
# 3. start
COPY start.sh /start.sh
CMD chmod +x /start.sh && sync && ./start.sh