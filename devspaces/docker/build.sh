#!/bin/sh

docker build -t devspaces/bazel .
docker push devspaces/bazel
