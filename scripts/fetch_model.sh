#!/usr/bin/env bash
# Download inference.onnx. Tries raw.githubusercontent.com first (portable across
# restrictive egress allowlists), falls back to the GitHub Release asset.
# Usage: scripts/fetch_model.sh [output_dir]   (default: repo root)
set -euo pipefail
REPO="oaustegard/PP-OCRv6_medium_det_onnx"
ASSET="inference.onnx"
OUT="${1:-.}/${ASSET}"
RAW="https://raw.githubusercontent.com/${REPO}/main/${ASSET}"
REL="https://github.com/${REPO}/releases/latest/download/${ASSET}"
echo "Fetching ${ASSET}..."
curl -fL "$RAW" -o "$OUT" || { echo "raw failed, trying release asset..."; curl -fL "$REL" -o "$OUT"; }
echo "Saved to ${OUT} ($(wc -c < "$OUT") bytes)"
