# Homepage Graphics Brief (Story Cards)

This brief defines exactly what to place in each homepage graphic slot used in `_config.yml`:

- `feature_graphic_discover`
- `feature_graphic_organize`
- `feature_graphic_dupe`

## Global specs

- **Canvas:** 1200 x 900 px (4:3), PNG or JPG.
- **Safe zone:** keep important UI in the center 70% (edges may crop on smaller screens).
- **Style:** clean, bright, app-first, minimal text baked into image.
- **Rule:** prefer real app UI over decorative overlays.

## Slot 1 — Discover

- **Card text it supports:** `Find the right paint fast.`
- **User problem it answers:** “Wait... do I already own this blue?”
- **What to show in the image:**
  - Paint list/grid with varied colors.
  - Search or filter context (brand/pigment/properties) visible.
  - A feeling of “many paints quickly narrowed.”
- **Avoid:** tiny unreadable labels, heavy marketing text, phone mockup frames.

## Slot 2 — Organize

- **Card text it supports:** `Map your real palette.`
- **User problem it answers:** “Which paint is in which well?”
- **What to show in the image:**
  - Palette layout UI with paint wells/cells clearly arranged.
  - Optional drag-and-drop state or reorder affordance.
  - Strong visual “this mirrors my real palette” cue.
- **Avoid:** generic paint swatches only (must feel like organization, not just browsing).

## Slot 3 — Paint Smarter

- **Card text it supports:** `Dupe it. Match it. Keep painting.`
- **User problem it answers:** “Tutorial uses paints I do not have.”
- **What to show in the image:**
  - Tutorial paint matching OR dupe comparison UI.
  - Status idea visible (e.g., own / dupe / need).
  - If possible, include substitute confidence/property matching context.
- **Avoid:** ambiguous screen that looks like generic list browsing.

## Handoff checklist

Before dropping assets into `assets/graphics/` and wiring paths in `_config.yml`, confirm:

- Each image clearly matches its card headline in under 1 second.
- All three together tell a sequence: **discover -> organize -> paint smarter**.
- No tiny text is required to understand the image.
