FROM pontusvisiongdpr/pontus-extract-discovery-base:latest as builder

FROM openjdk:8-jre-alpine as final
RUN apk upgrade -q --no-cache && \
    apk add -q --no-cache \
      bash \
      gettext \
      unzip \
      zip

RUN mkdir -p /opt/pontus-extract/discovery/lib && \
    addgroup -g 1000 -S pontus && \
    adduser -u 1000  -S -G pontus pontus && \
    chown -R pontus /opt/pontus-extract/

#COPY --from=builder --chown=pontus /pontusvision-extract-discovery/backend/dataprep-api-2.5.1.jar /opt/pontus-extract/discovery/lib/dataprep-api.jar
COPY --from=builder --chown=pontus /pontusvision-extract-discovery/backend/dataprep-api.jar /opt/pontus-extract/discovery/lib/dataprep-api.jar
COPY --from=builder --chown=pontus /pontusvision-extract-discovery/backend/dataprep-transformation.jar /opt/pontus-extract/discovery/lib/dataprep-transformation.jar
COPY --from=builder --chown=pontus /pontusvision-extract-discovery/backend/dataprep-dataset.jar /opt/pontus-extract/discovery/lib/dataprep-dataset.jar
COPY --from=builder --chown=pontus /pontusvision-extract-discovery/backend/dataprep-preparation.jar /opt/pontus-extract/discovery/lib/dataprep-preparation.jar

USER 1000
EXPOSE 8888
CMD java -jar /opt/pontus-extract/discovery/lib/dataprep-api.jar \
         -Dserver.port=8888 \
         -Ddataset.service.url=http://localhost:8888 \
         -Dpreparation.service.url=http://localhost:8888  \
         -Dtransformation.service.url=http://localhost:8888


