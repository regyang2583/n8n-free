FROM n8nio/n8n:latest

USER root
ENV N8N_PUSH_BACKEND=sse
ENV N8N_HOST=reg-hao-n8n-date.hf.space
ENV N8N_EDITOR_BASE_URL=https://reg-hao-n8n-date.hf.space
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://reg-hao-n8n-date.hf.space

USER node
