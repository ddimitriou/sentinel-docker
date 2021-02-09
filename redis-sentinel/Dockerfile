FROM redis:alpine

ARG SENTINEL_QUORUM
ARG SLAVE_OF
ARG MASTER_NAME
ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
ENV MASTER_NAME $MASTER_NAME
ENV SENTINEL_QUORUM $SENTINEL_QUORUM
ENV SENTINEL_DOWN_AFTER 5000
ENV SENTINEL_FAILOVER 10000
ENV SENTINEL_PORT 26379
ENV SLAVE_OF $SLAVE_OF
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT "entrypoint.sh"
