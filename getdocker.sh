#!/bin/bash
curl -s http://mirrors.ubuntu.com/mirrors.txt | xargs -n1 -I {} sh -c 'echo `curl -r 0-102400 -s -w %{speed_download} -o /dev/null {}/ls-lR.gz` {}' |sort -g -r |head -1| awk '{ print$2  }'| sed 's/\//\\\\\//g' | xargs -n1 -I{} sed -i 's/http\:\/\/archive.ubuntu.com\/ubuntu/{}/g' /etc/apt/sources.list
curl -sSL https://get.docker.com/ | sh
usermod -a -G docker vagrant