#set page(
  width: auto,
  height: auto,
  margin: 0pt,
  fill: none,
)

#set text(
  font: "Liberation Sans",
  size: 10pt,
  fill: rgb("#57606a"),
)

#let section-title(txt) = {
  text(size: 11pt, weight: "bold", fill: rgb("#24292f"))[#txt]
  v(12pt)
}

#block(
  width: 740pt,
  stroke: 1pt + rgb("#d0d7de"),
  radius: 8pt,
  fill: rgb("#ffffff"),
  inset: (x: 28pt, y: 22pt),
)[
  // 1. Prime Contractor
  #align(center)[
    #section-title("Prime Contractor & Software Engineering")
    #image("../assets/logos/B-Open.png", height: 30pt)
  ]

  #v(14pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#e1e4e8"))
  #v(14pt)

  // 2. Scientific Partners
  #align(center)[
    #section-title("Scientific & Consortium Partners")
    #grid(
      columns: (1fr, 1.3fr, 1fr),
      align: center + horizon,
      image("../assets/logos/DeltaPhi.svg", height: 34pt),
      image("../assets/logos/UA.svg", height: 52pt),
      image("../assets/logos/TUDelft.svg", height: 38pt),
    )
  ]

  #v(14pt)
  #line(length: 100%, stroke: 0.5pt + rgb("#e1e4e8"))
  #v(14pt)

  // 3. Institutional Support
  #align(center)[
    #section-title("Institutional Support & Data Providers")
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: center + horizon,
      image("../assets/logos/ESA.svg", height: 26pt),
      image("../assets/logos/CONAE.png", height: 32pt),
      image("../assets/logos/ASI.svg", height: 34pt),
    )
  ]
]
