#!/usr/bin/env bash

docker build -t metal-fluffychat:latest . && docker tag metal-fluffychat:latest jalalmetalmen/metal-fluffychat:latest && docker push jalalmetalmen/metal-fluffychat:latest