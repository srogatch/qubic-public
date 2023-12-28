FROM nvidia/cuda:12.3.1-devel-ubuntu22.04
ARG build_parallel=16

SHELL ["/bin/bash", "-c"]

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV CMAKE_BUILD_PARALLEL_LEVEL=$build_parallel

RUN mkdir -p /scratch/venv /app/

# Enable command "add-apt-repository"
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y software-properties-common lsb-release

# Install system dependencies
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential ninja-build dos2unix locales \
        libpq-dev libtbb-dev m4 \
        psmisc nvtop \
        sudo nano inetutils-ping time wget \
        python3.10 python3.10-dev python3.10-distutils python3.10-venv \
    && apt-get clean

RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3.10 get-pip.py \
    && rm get-pip.py \
    && python3.10 -m venv /scratch/venv/qubic-gpu

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null \
  | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
RUN apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
RUN apt update && apt install kitware-archive-keyring && rm /etc/apt/trusted.gpg.d/kitware.gpg
RUN apt install -y cmake

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
# RUN locale && false

# Activate the Python 3.10 virtual environment
ENV PATH="/scratch/venv/qubic-gpu/bin:${PATH}"
ENV CPLUS_INCLUDE_PATH="/usr/include/python3.10/:$CPLUS_INCLUDE_PATH"

RUN apt-get install -y --no-install-recommends libgmp3-dev python3-dev

# Reduce docker image size
RUN rm -rf /var/lib/apt/lists/*

VOLUME /app/work

WORKDIR /app/work
