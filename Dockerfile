FROM n8nio/n8n:latest

USER root
RUN node --version && cat /etc/os-release

USER node
