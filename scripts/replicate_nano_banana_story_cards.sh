#!/usr/bin/env bash
# Generate Smarty Paints story-card images via Replicate google/nano-banana-2
set -euo pipefail
OUT="${1:-/workspace/assets/graphics}"
mkdir -p "$OUT"
MODEL="google/nano-banana-2"
VERSION=$(curl -sS "https://api.replicate.com/v1/models/${MODEL}" \
  -H "Authorization: Bearer ${REPLICATE_API_TOKEN}" \
  | jq -r '.latest_version.id')

run_one() {
  local name="$1"
  local prompt="$2"
  echo "=== $name ===" >&2
  local resp
  resp=$(curl -sS "https://api.replicate.com/v1/predictions" \
    -H "Authorization: Bearer ${REPLICATE_API_TOKEN}" \
    -H "Content-Type: application/json" \
    -H "Prefer: wait" \
    -d "$(jq -n \
      --arg v "$VERSION" \
      --arg p "$prompt" \
      '{version: $v, input: {prompt: $p, aspect_ratio: "4:3", resolution: "1K", output_format: "jpg"}}')")
  local url
  url=$(echo "$resp" | jq -r '.output // empty')
  local err
  err=$(echo "$resp" | jq -r '.error // empty')
  if [[ -z "$url" || "$url" == "null" ]]; then
    echo "FAILED: $err" >&2
    echo "$resp" | jq . >&2
    return 1
  fi
  echo "$url"
  curl -sS -L "$url" -o "${OUT}/${name}.jpg"
  echo "Saved ${OUT}/${name}.jpg" >&2
}

# Prompts: explainer style, preserve recognizable app UI patterns, brand blue accents
DISCOVER='Professional marketing illustration for a watercolor paint catalog iPhone app called Smarty Paints. Flat modern UI mockup on a phone screen: search bar at top, filter chips for pigment and brand, scrollable grid of rectangular paint cards with large color swatches and readable paint names. Soft lavender and white background, accent blue #1d63ea for highlights. Clean simplified explainer style, not photorealistic, generous whitespace, no tiny illegible text. 4:3 composition, subject centered.'

ORGANIZE='Professional marketing illustration for Smarty Paints iPhone app: palette organizer screen. Grid of rounded paint wells with drag handles, one well highlighted with blue border, subtle "reorder" affordance. Warm watercolor-inspired accent colors in the swatches. Same soft UI style as a product website feature image: simplified, readable, friendly. Light purple-blue background, white card area. No photorealistic paint tubes. 4:3 centered composition.'

DUPE='Professional marketing illustration for Smarty Paints iPhone app: tutorial paint matching screen. Two side-by-side panels: "Class uses" paint on left, "You have" substitute on right, bold arrow labeled Close Match between them. Bottom status row with three pills: Own, Dupe (selected in blue #1d63ea), Need, plus a short "property match" line. Clean simplified UI explainer, readable labels, no clutter. Soft gradient background. 4:3 centered.'

run_one "discover_nano" "$DISCOVER"
run_one "organize_nano" "$ORGANIZE"
run_one "paint_smarter_nano" "$DUPE"

echo "Done. Files in $OUT" >&2
