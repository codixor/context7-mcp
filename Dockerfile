FROM node:25-bookworm-slim

ARG CONTEXT7_MCP_VERSION=2.1.6

WORKDIR /app

RUN npm install -g "@upstash/context7-mcp@${CONTEXT7_MCP_VERSION}" \
  && npm cache clean --force

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
