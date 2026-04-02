#!/bin/sh
set -eu

exec context7-mcp --transport stdio "$@"
