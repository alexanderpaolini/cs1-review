#import "../lib.typ": example

= Bitwise Operators

Bitwise Operators are how we manipulate binary numbers. There are a few main bitwise operators: `AMD`, `OR`, `XOR`, and `NOT`.

These operators apply the base logical operator to each bit.

== AND

The AND operator applies AND to each bit. This means that each bit is only on if both bits of the inputs are on.

#table(
  columns: 3,
  stroke: 1pt,
  inset: 10pt,

  [A], [B], [A AND B],

  [0], [0], [0],
  [0], [1], [0],
  [1], [0], [0],
  [1], [1], [1],
)

So, a binary $A$ and $B$ would be $A_0 \& B_0$, $A_1 \& B_1$, ..., for every corresponding bit in the two numbers.

#example(with: false)[Compute $1101$ *AND* $1011$]

$1101$ *AND* $1011$ = $1111$

== OR

The OR operator applies OR to each bit.

#table(
  columns: 3,
  stroke: 1pt,
  inset: 10pt,

  [A], [B], [A OR B],

  [0], [0], [0],
  [0], [1], [1],
  [1], [0], [1],
  [1], [1], [1],
)

So, a binary $A$ or $B$ would be $A_0 | B_0$, $A_1 | B_1$, ..., for every corresponding bit in the two numbers.

#example(with: false)[Compute $1101$ *OR* $1011$]

$1101$ *OR* $1011$ = $1111$

== XOR

The XOR (exclusive OR) operator applies XOR to each bit. This means one or the other, but not both.

#table(
  columns: 3,
  stroke: 1pt,
  inset: 10pt,

  [A], [B], [A XOR B],

  [0], [0], [0],
  [0], [1], [1],
  [1], [0], [1],
  [1], [1], [0],
)

So, a binary $A$ XOR $B$ would be $A_0 \oplus B_0$, $A_1 \oplus B_1$, ..., for every corresponding bit in the two numbers.

#example(with: false)[Compute $1101$ *XOR* $1011$]

$1101$ *XOR* $1011$ = $0110$

== NOT

The NOT operator inverts each bit of the number (also called the bitwise negation).

#table(
  columns: 2,
  stroke: 1pt,
  inset: 10pt,

  [A], [NOT A],

  [0], [1],
  [1], [0],
)

#example(with: false)[Compute *NOT* $1101$]

*NOT* $1101$ = $0010$
