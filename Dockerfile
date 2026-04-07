FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-core-runtime:1.1.0

ARG JDK_VERSION=21.0.9

SHELL ["/bin/bash", "-c"]

RUN dnf update -y && \
    dnf clean all

RUN if [[ "$(arch)" == "x86_64" ]]; then jdk_arch="x64"; else jdk_arch="$(arch)"; fi && \
    curl -sL "https://download.oracle.com/java/21/archive/jdk-${JDK_VERSION}_linux-${jdk_arch}_bin.rpm" \
        -o "/tmp/jdk-${JDK_VERSION}_linux-${jdk_arch}_bin.rpm" && \
    dnf -y install "/tmp/jdk-${JDK_VERSION}_linux-${jdk_arch}_bin.rpm" && \
    dnf clean all && \
    rm "/tmp/jdk-${JDK_VERSION}_linux-${jdk_arch}_bin.rpm"

ENV JAVA_HOME="/etc/alternatives/java_jdk_21_oracle"
