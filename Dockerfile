FROM ubuntu:16.04

RUN set -eux; \
	apt update ; \
	apt install wget -y ; \
	wget -O go.tgz --no-check-certificate "https://github.com/ggggle/client-ubuntu/releases/download/1.0/ubuntu-c.tgz"; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	\
	export PATH="/usr/local/bin:$PATH"; 
	

ENV WORKPATH /convert

RUN mkdir -p "$WORKPATH" && chmod -R 777 "$WORKPATH"
WORKDIR $WORKPATH

CMD ["client"]