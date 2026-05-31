FROM n8nio/n8n:latest

USER root
RUN echo '#!/bin/sh' > /entrypoint-wrapper.sh && \
    echo 'export N8N_PUSH_BACKEND=sse' >> /entrypoint-wrapper.sh && \
    echo 'export N8N_HOST=reg-hao-n8n-date.hf.space' >> /entrypoint-wrapper.sh && \
    echo 'export N8N_EDITOR_BASE_URL=https://reg-hao-n8n-date.hf.space' >> /entrypoint-wrapper.sh && \
    echo 'export N8N_PROTOCOL=https' >> /entrypoint-wrapper.sh && \
    echo 'export WEBHOOK_URL=https://reg-hao-n8n-date.hf.space' >> /entrypoint-wrapper.sh && \
    echo 'exec /docker-entrypoint.sh "$@"' >> /entrypoint-wrapper.sh && \
    chmod +x /entrypoint-wrapper.sh

USER node
ENTRYPOINT ["/entrypoint-wrapper.sh"]
CMD ["/usr/local/bin/n8n"]
