FROM n8nio/n8n:latest

USER root
RUN which n8n || find / -name "n8n" -type f 2>/dev/null | head -5

USER node
