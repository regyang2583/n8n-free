FROM n8nio/n8n:latest

USER root

RUN printf '#!/bin/sh\nset -e\n\
echo "[DEBUG] which n8n: $(which n8n)"\n\
echo "[DEBUG] ls /usr/local/lib/node_modules/n8n/dist/: $(ls /usr/local/lib/node_modules/n8n/dist/ 2>/dev/null | head -5)"\n\
echo "[DEBUG] ls /usr/local/bin/: $(ls /usr/local/bin/ | grep n8n)"\n\
export N8N_EDITOR_BASE_URL="${N8N_EDITOR_BASE_URL:-https://reg-hao-n8n-date.hf.space}"\n\
export WEBHOOK_URL="${WEBHOOK_URL:-https://reg-hao-n8n-date.hf.space}"\n\
export N8N_HOST="${N8N_HOST:-reg-hao-n8n-date.hf.space}"\n\
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"\n\
export N8N_PORT="${N8N_PORT:-7860}"\n\
export N8N_PUSH_BACKEND="websocket"\n\
export N8N_PROXY_HOPS="${N8N_PROXY_HOPS:-1}"\n\
export N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true\n\
exec /usr/local/bin/n8n start\n' > /entrypoint.sh \
    && chmod +x /entrypoint.sh

USER node
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
