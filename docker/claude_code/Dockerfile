FROM node:20-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

RUN useradd -m -s /bin/bash developer

RUN mkdir -p /home/developer/workspace && \
    chown -R developer:developer /home/developer

USER developer

WORKDIR /home/developer/workspace

CMD ["claude", "--dangerously-skip-permissions"]