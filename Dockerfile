FROM n8nio/n8n:latest

USER root
ENV N8N_PUSH_BACKEND=sse

USER node
