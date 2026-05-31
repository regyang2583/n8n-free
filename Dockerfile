FROM n8nio/n8n:latest

USER root
RUN echo '#!/bin/sh' > /entrypoint-wrapper.sh && \
    echo 'export N8N_PUSH_BACKEND=sse' >> /entrypoint-wrapper.sh && \
    echo 'export N8N_EDITOR_BASE_URL=https://reg-hao-n8n-date.hf.space' >> /entrypoint-wrapper.sh && \
    echo 'echo "=== ENV CHECK ===" >> /proc/1/fd/1' >> /entrypoint-wrapper.sh && \
    echo 'echo "PUSH_BACKEND=$N8N_PUSH_BACKEND" >> /proc/1/fd/1' >> /entrypoint-wrapper.sh && \
    echo 'echo "EDITOR_URL=$N8N_EDITOR_BASE_URL" >> /proc/1/fd/1' >> /entrypoint-wrapper.sh && \
    echo 'exec /usr/local/bin/n8n start' >> /entrypoint-wrapper.sh && \
    chmod +x /entrypoint-wrapper.sh

USER node
ENTRYPOINT ["/bin/sh", "/entrypoint-wrapper.sh"]
