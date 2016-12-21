#!/usr/bin/env sh

set -e

mysqld_safe --datadir='/var/lib/mysql' &
sleep 2
mysqladmin create chaos-loris

cd chaos-loris
./mvnw clean package

cp manifest.yml ../chaos-loris-deploy
cp -r target ../chaos-loris-deploy

mysqladmin shutdown
