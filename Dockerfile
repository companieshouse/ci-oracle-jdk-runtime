ARG CORE_VERSION="latest"
FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-core-runtime:${CORE_VERSION}

RUN dnf update -y && \
    dnf install -y  \
    tar \
    wget \
    unzip \
    gzip && \
    dnf clean all && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm && \
    rpm -Uvh jdk-17_linux-x64_bin.rpm