FROM arm64v8/ubuntu:kinetic
COPY ./AgentDVR/ /WORKSPACE/
WORKDIR /WORKSPACE
RUN bash ./linux_setup.sh
CMD ["/WORKSPACE/AgentDVR/Agent"]
