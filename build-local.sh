#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd $DIR/gui
docker build --rm . -t pontusvisiongdpr/pontus-extract-discovery-gui 

cd $DIR/base
docker build --rm . -t pontusvisiongdpr/pontus-extract-discovery-base 

cd $DIR/full-backend
docker build --rm . -t pontusvisiongdpr/pontus-extract-discovery-backend

docker push pontusvisiongdpr/pontus-extract-discovery-gui
docker push pontusvisiongdpr/pontus-extract-discovery-base
docker push pontusvisiongdpr/pontus-extract-discovery-backend



