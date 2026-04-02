# context7-mcp

Local Docker-managed wrapper for
[`@upstash/context7-mcp`](https://www.npmjs.com/package/@upstash/context7-mcp).

This wrapper keeps the same Docker MCP shape as your other custom MCP servers:

- local Docker image
- Docker MCP `catalog.yaml`
- machine-local `config.yaml`
- pinned published package version
- optional `CONTEXT7_API_KEY` secret support

## Upstream Pins

- package: `@upstash/context7-mcp`
- version: `2.1.6`
- source repo: <https://github.com/upstash/context7/tree/main/packages/mcp>

## Tools

- `resolve-library-id`
- `get-library-docs`

## Build

```bash
docker build -t context7-mcp:latest .
```

## Direct Docker Run

```bash
docker run -i --rm \
  -e CONTEXT7_API_KEY=your_api_key \
  context7-mcp:latest
```

## Docker MCP

Import the local catalog:

```bash
docker mcp catalog import /Users/mwdghaz/mcp-workspace/context7-mcp/catalog.yaml
```

Then enable the server in Docker MCP Toolkit.

If you want higher rate limits or private repositories, store your key in Docker MCP:

```bash
printf '%s' 'YOUR_API_KEY' | docker mcp secret set CONTEXT7_API_KEY
```

## Notes

- no host workspace mount is needed
- runtime network access stays enabled because the server queries Context7
- API key auth is optional for basic public usage
