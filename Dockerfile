FROM node:7.8.0
WORKDIR /opt
ADD . /opt
RUN echo 'test'
CMD ["bash"]
