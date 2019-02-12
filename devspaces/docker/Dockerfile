FROM openjdk:8

ENV BAZEL_DIR=/data \
    BAZEL_BINARY=/bazeldist/output/bazel \
    BAZEL_COMMAND=version \
    BAZEL_LATEST_VERSION=0.22.0

WORKDIR /bazeldist

RUN apt-get update && \
    apt-get install -y build-essential git python unzip wget zip && \
    apt-get clean all && \
    # bazel is used to build bazel ...
    wget https://github.com/bazelbuild/bazel/releases/download/$BAZEL_LATEST_VERSION/bazel-$BAZEL_LATEST_VERSION-dist.zip -O bazel-dist.zip && \ 
    unzip bazel-dist.zip && \
    rm bazel-dist.zip && \
    ./compile.sh
