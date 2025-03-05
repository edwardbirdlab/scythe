FROM debian:latest

# dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    clang \
    zlib1g-dev \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /scythe

# Download and build Scythe
RUN wget https://github.com/vsbuffalo/scythe/archive/master.zip && \
    unzip master.zip && \
    cd scythe-master && \
    make all && \
    mv scythe /usr/local/bin/ && \
    cd .. && rm -rf scythe-master master.zip

# Set default command
ENTRYPOINT ["scythe"]
