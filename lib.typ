#let example-counter = counter("example")

#let setup(body) = {
  set page(
    paper: "us-letter",
    header: [
      CS1 Review
    ],
    footer: context [
      #h(1fr)
      #counter(page).display(
        "1/1",
        both: true,
      )
    ],
  )

  set text(
    font: "New Computer Modern",
    size: 14pt,
  )

  show heading: it => {
    example-counter.update(1)
    it
  }

  show heading.where(level: 1): it => {
    pagebreak()
    it
  }

  body
}

#let title(body) = {
  align(center, text(24pt)[
    #body
  ])
}

#let problem(body) = {
  block(
    stroke: (left: 2pt + black),
    pad(body, left: 1em, y: 0.5em),
  )
}

#let note(body) = {
  pad([ *Note*: #body ], left: 2em)
}

#let example(body, with: true) = context {
  if with == false {
    [
      #strong([Example]): #body
    ]
  } else {
    example-counter.update(example-counter.get().last() + 1)
    [
      #strong([Example #example-counter.display()]): #body
    ]
  }
}
