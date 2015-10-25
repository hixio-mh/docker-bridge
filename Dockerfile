FROM mhart/alpine-node:4.2
MAINTAINER Corey Butler

# Add 0MQ
RUN apk add --update zeromq zeromq-dev pkgconfig python gcc g++ make bash

# Set the working directory
VOLUME ["/app"]
WORKDIR /app
RUN mkdir -p /node_modules && cd /node_modules && npm i zmq ngn ngn-sse && cd /app

RUN apk del zeromq-dev pkgconfig python gcc g++ make

EXPOSE 5555

CMD ["/bin/bash"]
#CMD ["node","index.js"]

#ADD gnatsd /gnatsd
#ADD gnatsd.conf /gnatsd.conf
#
## Expose client, management, and routing/cluster ports
#EXPOSE 4222 8222 6222
#
#ENTRYPOINT ["/gnatsd", "-c", "/gnatsd.conf"]
