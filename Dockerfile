FROM --platform=linux/arm64 node:current
WORKDIR /opt
ADD . /opt
RUN apt-get update && apt-get install -y curl
CMD ["bash"]
