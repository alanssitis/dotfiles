#let assignment(
  course: none,
  semester: none,
  assignment-title: none,
  due-date: none,
  authors: (),
  doc
) = {
  show title: set align(center)

  let footer-names = authors.map(author => author.name + " " + author.matriculation-number).join(", ")

  set page(
    paper: "a4",
    header: align(right + horizon)[
      #course #semester: #assignment-title
    ],
    footer: context [
      #footer-names #h(1fr) #counter(page).display("1 / 1", both: true)
    ]
  )

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      title[#assignment-title]
      "Due " + due-date.display("[day].[month].[year]")

      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        ..authors.map(author => [
          #author.name \
          #author.matriculation-number
          #if ("email" in author.keys()) {
          [\ #link("mailto:" + author.email)]
          }
        ]),
      )
    }
  )

  doc
}
