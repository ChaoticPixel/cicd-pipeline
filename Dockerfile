FROM node:7.8.0
WORKDIR /opt
ADD . /opt
RUN apt-get update && apt-get install -y curl
CMD ["bash"]
