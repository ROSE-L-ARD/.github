#set page(
  width: auto,
  height: auto,
  margin: 0pt,
  fill: none,
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  fill: rgb("#8b949e"),
)

#let section-title(txt) = {
  text(size: 11pt, weight: "bold", fill: rgb("#f0f6fc"))[#txt]
  v(12pt)
}

#let logo-tile(img-path, h, pad-x: 14pt) = {
  rect(
    fill: rgb("#ffffff"),
    radius: 6pt,
    inset: (x: pad-x, y: 8pt),
    stroke: 1pt + rgb("#30363d"),
    image(img-path, height: h),
  )
}

#block(
  width: 740pt,
  stroke: 1pt + rgb("#30363d"),
  radius: 8pt,
  fill: rgb("#161b22"),
  inset: (x: 28pt, y: 22pt),
)[
  // 1. Prime Contractor
  #align(center)[
    #section-title("Prime Contractor & Software Engineering")
    #logo-tile("../assets/logos/B-Open.svg", 30pt, pad-x: 20pt)
  ]

  #v(14pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#30363d"))
  #v(14pt)

  // 2. Scientific Partners
  #align(center)[
    #section-title("Scientific & Consortium Partners")
    #grid(
      columns: (1fr, 1.3fr, 1fr),
      align: center + horizon,
      logo-tile("../assets/logos/DeltaPhi.svg", 30pt),
      logo-tile("../assets/logos/UA.svg", 38pt),
      logo-tile("../assets/logos/TUDelft.svg", 30pt),
    )
  ]

  #v(14pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#30363d"))
  #v(14pt)

  // 3. Institutional Support
  #align(center)[
    #section-title("Institutional Support & Data Providers")
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: center + horizon,
      logo-tile("../assets/logos/ESA.svg", 26pt),
      logo-tile("../assets/logos/CONAE.png", 30pt),
      logo-tile("../assets/logos/ASI.svg", 32pt),
    )
  ]
]
