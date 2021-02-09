#!/bin/sh

sed -i "s/\$MASTER_NAME/$MASTER_NAME/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_PORT/$SENTINEL_PORT/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_FAILOVER/$SENTINEL_FAILOVER/g" /etc/redis/sentinel.conf
sed -i "s/\$SLAVE_OF/$SLAVE_OF/g" /etc/redis/sentinel.conf

if [ -z "$PASSWORD" ]; then
  echo "sentinel auth-pass $MASTER_NAME $PASSWORD" >> /etc/redis/sentinel.conf
fi

exec docker-entrypoint.sh redis-server /etc/redis/sentinel.conf --sentinel
