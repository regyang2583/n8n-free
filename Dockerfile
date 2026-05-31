FROM n8nio/n8n:latest

USER root

RUN printf '#!/bin/sh\nset -e\n\
echo "[DEBUG] N8N_EDITOR_BASE_URL=${N8N_EDITOR_BASE_URL}"\n\
echo "[DEBUG] N8N_PUSH_BACKEND=${N8N_PUSH_BACKEND}"\n\
export N8N_EDITOR_BASE_URL="${N8N_EDITOR_BASE_URL:-https://reg-hao-n8n-date.hf.space}"\n\
export WEBHOOK_URL="${WEBHOOK_URL:-https://reg-hao-n8n-date.hf.space}"\n\
export N8N_HOST="${N8N_HOST:-reg-hao-n8n-date.hf.space}"\n\
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"\n\
export N8N_PORT="${N8N_PORT:-7860}"\n\
export N8N_PUSH_BACKEND="${N8N_PUSH_BACKEND:-sse}"\n\
export N8N_PROXY_HOPS="${N8N_PROXY_HOPS:-1}"\n\
exec /usr/local/bin/n8n start\n' > /entrypoint.sh \
    && chmod +x /entrypoint.sh

USER node
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
