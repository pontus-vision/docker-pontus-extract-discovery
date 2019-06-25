FROM  node:7 as discovery-ui
WORKDIR /

RUN git clone --single-branch --depth 1  --branch pontus-2.5.1  https://github.com/pontus-vision/pontusvision-extract-discovery.git && \
    cd pontusvision-extract-discovery/dataprep-webapp && \
    npm install -g strip-ansi npm && \
    npm install

RUN cd pontusvision-extract-discovery/dataprep-webapp && \
    npm  run-script build:dist


FROM alpine

RUN mkdir -p /opt/pontus/pontus-gui-discovery

COPY --from=discovery-ui /pontusvision-extract-discovery/dataprep-webapp/build /opt/pontus/pontus-gui-discovery/lib
