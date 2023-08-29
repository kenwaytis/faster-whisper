FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

ENV PYTHON_VERSION=3.10
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq update \
    && apt-get -y install \
    && apt-get install -y --no-install-recommends  \
    python${PYTHON_VERSION} \
    python3-pip  \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s -f /usr/bin/python${PYTHON_VERSION} /usr/bin/pytshon3 \
    && ln -s -f /usr/bin/python${PYTHON_VERSION} /usr/bin/python \
    && ln -s -f /usr/bin/pip3 /usr/bin/pip \
    && pip install --no-cache-dir --upgrade pip

RUN mkdir -p /home/faster-whisper
WORKDIR /home/faster-whisper
COPY . .

RUN pip install -r requirements.txt \
    && pip install faster-whisper
