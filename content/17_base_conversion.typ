#import "../lib.typ": example

= Base Conversion

In base 10, or the decimal system that we use for numbers, any number can be represented as $d_0*10^0 + d_1*10^1+d_2*10^2 + ... + d_n*10^n$

#example(with: false)[$1029 = 9*10 + 2*10^2 + 0*10^3 + 1*10^3$]

== Base 2 to Base 10

We can do the exact same thing in binary, except we use 2 because it is base 2. Where a binary number can be converted to decimal like $d_0*2^0 + d_1*2^1 + d_2*2^2 + ... + d_n*2^n$

#example(with: false)[Convert ${0010 0111}_2$ to decimal.]

$1*2^0 + 1*2^1 + 1*2^2 + 0*2^3 + 0*2^4 + 1*2^5 + 0*2^6 + 0*2^7 = 39$

== Base 2 to Base 16

Converting base 2 to base 16, or hex, is trivial. 4 bits can represent 16 different numbers. As such, each 4 block of a binary digit represents a single base 16 digit (which is represented as 0-F).

=== Conversion Chart

#box(height: 180pt)[
  #columns(2)[
    #align(center)[
      #table(
        columns: 2,
        stroke: 1pt,

        [base 2], [base 16],
        [0000], [0],
        [0001], [1],
        [0010], [2],
        [0011], [3],
        [0100], [4],
        [0101], [5],
        [0110], [6],
        [0111], [7],
        [base 2], [base 16],
        [1000], [8],
        [1001], [9],
        [1010], [A],
        [1011], [B],
        [1100], [C],
        [1101], [D],
        [1110], [E],
        [1111], [F],
      )
    ]
  ]
]

Note: This conversion chart is super easy to figure out. Do not memorize it.

#example(with: false)[Convert ${0010 0111}_2$ to base 16.]

$0010 arrow.r 2$ and $0111 arrow.r 7$ so $27$

== Base 2 to Base 4 and 8

THe same trick applies to base 4 and base 8, only the number of bits is smaller.

== Decimal to Base 2

To convert a decimal number to binary, you repeatidly divide the number by 2 and keep track of the remainders.

=== Steps

1. Divide the number by 2.
2. Write down the remainder (either 0 or 1).
3. Update the number to be the quotient of the division.
4. Repeat until the number becomes 0.
5. The binary number is the remainders read in reverse order (bottom to top).

#example(with: false)[Convert $13_10$ to base 2.]

```txt
13 ÷ 2 = 6, remainder = 1
 6 ÷ 2 = 3, remainder = 0
 3 ÷ 2 = 1, remainder = 1
 1 ÷ 2 = 0, remainder = 1
```

So, $13_10$ in binary is $1101_2$.

== Decimal to Any Other Base

To convert decimal to any other base, follow the same process but divide by the desired base instead of 2.

#example(with: false)[Convert $26_10$ to base 3.]

```txt
26 ÷ 3 = 8 remainder 2
 8 ÷ 3 = 2 remainder 2
 2 ÷ 3 = 0 remainder 2
```

So, $26_10$ to base 3 is $222_3$.
