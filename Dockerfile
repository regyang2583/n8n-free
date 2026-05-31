FROM n8nio/n8n:latest

USER root

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER node
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
