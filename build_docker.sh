#! /usr/bin/env bash
docker build -t rev-pwn .
docker run -it -p 9020:9020 -p 9021:5900 rev-pwn
