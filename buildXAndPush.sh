#!/bin/bash

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t dottgonzo/rtsp-simple-server:stable --push .