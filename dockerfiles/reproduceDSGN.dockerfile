# Use the official Ubuntu 20.04 as a base image
# FROM ubuntu:20.04
# FROM nvidia/cuda:12.3.0-devel-ubuntu20.04
# FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu20.04
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04


# Set the maintainer label (optional)
LABEL maintainer="your-email@example.com"

# Prevent prompts from some packages
ENV DEBIAN_FRONTEND=noninteractive

# COPY . /home/DSGN

# # Set the working directory in the container
# WORKDIR /home/DSGN

# Update the package list and install Python, g++, python3-dev, and other basic packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    vim \
    python3 \
    python3-pip \
    python3-dev \
    g++ \
    libboost-dev \
    cmake \
    libgl1-mesa-glx \
    libglib2.0-0 \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENV FORCE_CUDA="1"
ENV MMCV_WITH_OPS=1



#  cudnn 
# RUN wget https://developer.nvidia.com/downloads/compute/cudnn/secure/8.9.7/local_installers/11.x/cudnn-local-repo-ubuntu2004-8.9.7.29_1.0-1_amd64.deb
# RUN apt-get update && apt-get install -y wget
# RUN dpkg -i cudnn-local-repo-ubuntu2004-8.9.7.29_1.0-1_amd64.deb || apt-get install -f -y
# RUN ls -l /var
# RUN ls -l /var/cudnn-local-repo-ubuntu2004-8.9.7.29
# RUN cp /var/cudnn-local-repo-ubuntu2004-8.9.7.29/cudnn-local-CD2C2DD4-keyring.gpg /usr/share/keyrings/
# RUN echo 'deb [signed-by=/usr/share/keyrings/cudnn-local-CD2C2DD4-keyring.gpg] file:///var/cudnn-local-repo-ubuntu2004-8.9.7.29/ /' | tee /etc/apt/sources.list.d/cudnn-local.list > /dev/null
# RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
# RUN apt-get update
# RUN apt-get install -y --no-install-recommends libcudnn8=8.0.5.39-1+cuda11.0  libcudnn8-dev=8.0.5.39-1+cuda11.0 

RUN pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install tensorboardX yacs opencv-python fire scipy scikit-image numba

CMD ["bash"]