FROM alpine as builder
RUN apk upgrade -q --no-cache
RUN apk add -q --no-cache \
      bash \
      gettext \
      git \
      maven \
      apache-ant \
      openjdk8 \
      openjdk8-jre-base \
      openssl \
      unzip \
      nodejs \
      zip


RUN git clone   --depth 1 --single-branch --branch master https://github.com/pontus-vision/talend-tools.git
RUN cd talend-tools/talend-tools-maven-plugin && \
    mvn clean install -U -DskipTests
RUN cd talend-tools/tools-java-formatter && \
    mvn clean install -U -DskipTests
RUN cd talend-tools/tools-root-maven && \
    mvn clean install -U -DskipTests
    

#RUN git clone   --depth 1 --single-branch --branch master https://github.com/pontus-vision/talend-components.git
#RUN cd talend-components && \
    #mvn clean install -U -DskipTests

RUN git clone  --depth 1 --single-branch --branch master https://github.com/pontus-vision/talend-jackson-1.git
RUN cd talend-jackson-1 && \
    chmod 755 ./build.sh && \
    ./build.sh

RUN git clone   --depth 1 --single-branch --branch pontus-0.23.1  https://github.com/pontus-vision/daikon.git
RUN cd daikon && \
    mvn clean install -U -DskipTests

RUN git clone   --depth 1 --single-branch --branch pontus-5.0.2  https://github.com/pontus-vision/data-quality.git
RUN cd data-quality && \
    mvn clean install -U -DskipTests


RUN git clone  --single-branch --depth 1  --branch pontus-2.5.1  https://github.com/pontus-vision/pontusvision-extract-discovery.git
RUN cd pontusvision-extract-discovery/ && \
    mvn clean install -U -DskipTests  

FROM alpine as final

RUN mkdir -p /pontusvision-extract-discovery/backend

COPY --from=builder /pontusvision-extract-discovery/dataprep-api/target/dataprep-api-2.5.1.jar /pontusvision-extract-discovery/backend/dataprep-api.jar
COPY --from=builder /pontusvision-extract-discovery/dataprep-transformation/target/dataprep-transformation-2.5.1.jar /pontusvision-extract-discovery/backend/dataprep-transformation.jar
COPY --from=builder /pontusvision-extract-discovery/dataprep-dataset/target/dataprep-dataset-2.5.1.jar /pontusvision-extract-discovery/backend/dataprep-dataset.jar
COPY --from=builder /pontusvision-extract-discovery/dataprep-preparation/target/dataprep-preparation-2.5.1.jar /pontusvision-extract-discovery/backend/dataprep-preparation.jar


