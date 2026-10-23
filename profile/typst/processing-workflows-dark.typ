// COP-ARD processing workflows diagram (Dark Mode).
// Regenerate: typst compile --root . typst/processing_workflows-dark.typ assets/processing_workflows-dark.svg

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

// =============================================================================
// COLOR PALETTE (Dark Mode Scientific / GitHub Dark Aligned)
// =============================================================================
#let c-canvas = rgb("#0d1117")    // GitHub Dark background
#let c-text-dark = rgb("#f0f6fc") // High-contrast title
#let c-text-body = rgb("#c9d1d9") // GitHub Dark primary text
#let c-text-muted = rgb("#8b949e")

// Raw Inputs (Deep Sky)
#let in-border = rgb("#38bdf8")   // Sky 400
#let in-fill = rgb("#082f49")     // Sky 950
#let in-title = rgb("#bae6fd")    // Sky 200
#let in-sub = rgb("#7dd3fc")      // Sky 300

// Standard Processing Units (Deep Indigo)
#let unit-border = rgb("#818cf8") // Indigo 400
#let unit-fill = rgb("#1e1b4b")   // Indigo 950
#let unit-title = rgb("#e0e7ff")  // Indigo 100
#let unit-desc = rgb("#a5b4fc")   // Indigo 300

// Auxiliary Data (ADFs & REFDB — Deep Warm Amber)
#let adf-border = rgb("#fbbf24")  // Amber 400
#let adf-fill = rgb("#451a03")    // Amber 950
#let adf-text = rgb("#fde68a")    // Amber 200
#let refdb-sub = rgb("#fcd34d")   // Amber 300

// Deliverable Products (Deep Emerald)
#let prod-border = rgb("#34d399") // Emerald 400
#let prod-fill = rgb("#022c22")   // Emerald 950
#let prod-title = rgb("#a7f3d0")  // Emerald 200
#let prod-sub = rgb("#6ee7b7")    // Emerald 300

// Connectors & Badges
#let edge-solid = rgb("#94a3b8")  // Slate 400 (visible against #0d1117)
#let edge-aux = rgb("#f59e0b")    // Amber 500
#let badge-border = rgb("#30363d") // GitHub Dark border
#let badge-fill = rgb("#161b22")   // GitHub Dark surface
#let badge-text = rgb("#e2e8f0")   // Slate 200

#let dashed-edge = (paint: edge-aux, thickness: 0.85pt, dash: (2.8pt, 2.4pt))

// =============================================================================
// REUSABLE COMPONENTS
// =============================================================================
#let task(title, desc) = align(center)[
  #text(weight: "bold", size: 7.2pt, fill: unit-title)[#title]
  #if desc != none [
    \ #v(1.2pt)
    #text(size: 5.9pt, fill: unit-desc)[#desc]
  ]
]

#let adf(title) = text(weight: "bold", size: 6.4pt, fill: adf-text)[#title]

// Monospace artifact chips (compact & neutral)
#let art(name) = box(
  fill: badge-fill,
  stroke: 0.5pt + badge-border,
  inset: (x: 3.2pt, y: 1.4pt),
  radius: 2pt,
  text(
    font: ("Fira Code", "JetBrains Mono", "DejaVu Sans Mono", "monospace"),
    size: 5.4pt,
    weight: "medium",
    fill: badge-text,
  )[#name],
)

// =============================================================================
// PAGE & DIAGRAM SETUP
// =============================================================================
#set page(
  width: auto,
  height: auto,
  margin: (x: 8mm, y: 5mm),
  fill: c-canvas,
)
#set text(
  font: ("Inter", "Segoe UI", "Liberation Sans", "DejaVu Sans", "sans-serif"),
  size: 7.2pt,
)

#box[
  // --- Header ---
  #align(center)[
    #text(size: 10.5pt, weight: "bold", fill: c-text-dark)[COP-ARD-Processor Workflows]
  ]
  #v(2.5mm)

  // --- Graph ---
  #diagram(
    spacing: (13mm, 10.5mm),
    node-inset: 2.6mm,
    node-corner-radius: 4pt,
    edge-corner-radius: 5pt,
    node-stroke: (paint: unit-border, thickness: 0.8pt),
    node-fill: unit-fill,
    edge-stroke: (paint: edge-solid, thickness: 0.85pt),
    mark-scale: 75%,
    label-size: 5.8pt,

    // -------------------------------------------------------------------------
    // COLUMN 0: Primary Ingestion & Core Processing Backbone
    // -------------------------------------------------------------------------
    node(
      (0, 0),
      align(center)[
        #text(weight: "bold", fill: in-title)[L1 SLC] \
        #v(1pt)
        #text(size: 5.8pt, fill: in-sub)[acquisitions]
      ],
      shape: fletcher.shapes.parallelogram,
      stroke: (paint: in-border, thickness: 0.95pt),
      fill: in-fill,
    ),
    node((0, 1), task([Ingestion], [radiometric calibration, \ deramping · ETAD timing])),
    node((0, 2), task([ReferenceDEM], [crop · resample])),
    node((0, 3), task([ReferenceGeometry], [master geometry \ layover & shadow masks])),
    node((0, 4), task([Coregistration], [warping · image matching \ split-spectrum · ESD])),
    node(
      (0, 5),
      align(center)[
        #text(weight: "bold", fill: prod-title)[CSLC product] \
      ],
      shape: fletcher.shapes.parallelogram,
      stroke: (paint: prod-border, thickness: 1.0pt),
      fill: prod-fill,
    ),

    // -------------------------------------------------------------------------
    // COLUMN 1: Multi-Looking & Geocoding Branch
    // -------------------------------------------------------------------------
    node((1, 4), task([CMLP], [multi-looked stack \ stable targets])),
    node((1, 5), task([Geocoding], [radar to map grid])),
    node(
      (1, 6),
      align(center)[
        #text(weight: "bold", fill: prod-title)[GMLP product] \
        #v(1pt)
      ],
      shape: fletcher.shapes.parallelogram,
      stroke: (paint: prod-border, thickness: 1.0pt),
      fill: prod-fill,
    ),

    // -------------------------------------------------------------------------
    // COLUMN -1: Auxiliary Inputs (ADFs) & REFDB
    // -------------------------------------------------------------------------
    node((-1, 0), adf([ORBIT ADF]), corner-radius: 3pt, stroke: 0.8pt + adf-border, fill: adf-fill),
    node((-1, 1), adf([ETAD ADF]), corner-radius: 3pt, stroke: 0.8pt + adf-border, fill: adf-fill),
    node((-1, 2), adf([DEM ADF]), corner-radius: 3pt, stroke: 0.8pt + adf-border, fill: adf-fill),
    node((-1, 3), adf([IONO ADF]), corner-radius: 3pt, stroke: 0.8pt + adf-border, fill: adf-fill),
    node(
      (1, 0),
      align(center)[
        #text(weight: "bold", fill: adf-text)[REFDB] \
        #v(1pt)
        #text(size: 5.5pt, fill: refdb-sub)[
          Auxiliary input to all units
        ]
      ],
      width: 30mm,
      stroke: (paint: adf-border, thickness: 0.85pt, dash: (2.8pt, 2.4pt)),
      fill: adf-fill,
      corner-radius: 3pt,
    ),

    // -------------------------------------------------------------------------
    // DATAFLOW EDGES (Artifact Transfers)
    // -------------------------------------------------------------------------
    edge((0, 0), (0, 1), "-|>", art("slcs")),
    edge((0, 1), (0, 2), "-|>", art("slcs")),
    edge((0, 2), (0, 3), "-|>", art("dem")),
    edge((0, 3), (0, 4), "-|>", stack(dir: ttb, spacing: 1.5pt, art("sim_ref"), art("sim_ml"))),
    edge((0, 4), (0, 5), "-|>"),
    edge((0, 4), (1, 4), "-|>", art("cslcs")),
    edge((1, 4), (1, 5), "-|>", art("cmlp")),
    edge((1, 5), (1, 6), "-|>"),

    // -------------------------------------------------------------------------
    // AUXILIARY EDGES (ADFs & REFDB)
    // -------------------------------------------------------------------------
    edge((-1, 0), (0, 1), "-|>", stroke: dashed-edge),
    edge((-1, 1), (0, 1), "-|>", stroke: dashed-edge),
    edge((-1, 2), (0, 2), "-|>", stroke: dashed-edge),
    edge((-1, 3), (0, 4), "-|>", stroke: dashed-edge, bend: -10deg),
    edge((0, 1), "r,d,d", (0, 3), "-|>", stroke: dashed-edge),
    edge((1, 0), (0, 1), "-|>", stroke: dashed-edge),
  )

  // --- Legend ---
  #v(2.5mm)
  #align(center)[
    #box(
      fill: rgb("#161b22"),
      stroke: 0.5pt + rgb("#30363d"),
      radius: 3.5pt,
      inset: (x: 8pt, y: 4pt),
    )[
      #set text(size: 6.2pt, fill: c-text-body)
      #box(width: 14pt, baseline: -0.5pt, line(length: 100%, stroke: 0.85pt + edge-solid))
      #h(4pt) Primary pipeline artifacts
      #h(12pt)
      #box(width: 14pt, baseline: -0.5pt, line(length: 100%, stroke: dashed-edge))
      #h(4pt) Auxiliary ADF reads / REFDB updates
    ]
  ]
]
