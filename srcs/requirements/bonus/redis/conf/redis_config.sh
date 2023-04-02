#!/bin/bash

if [-e /etc/redis/redis.conf]
then
	sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf
	sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
else
	cp ./conf/redis.conf /etc/redis/redis.conf
fi