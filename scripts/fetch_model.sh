#!/usr/bin/env bash
# Download inference.onnx from the latest GitHub release of this repo.
# Usage: scripts/fetch_model.sh [output_dir]   (default: repo root)
set -euo pipefail
REPO="oaustegard/PP-OCRv6_medium_det_onnx"
ASSET="inference.onnx"
OUT="${1:-.}/${ASSET}"
URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"
echo "Fetching ${ASSET} from ${REPO} latest release..."
curl -fL "$URL" -o "$OUT"
echo "Saved to ${OUT} ($(wc -c < "$OUT") bytes)"
