#import "../lib.typ": example

= 2's Complement

Representing negative numbers isn't trivial in binary. There are 3 main methods: sign magnitude, 1's complement, and 2's complement.

== Sign Magnitude

Sign magnitude is a method of storing the sign of the number in the MSB of the number.

#example(with: false)[]

$10100011_2 = -35_10$

$00100011_2 = 35_10$

=== Pros

- Sign magnitude is very simple and easy to understand.

=== Cons

- $0$ is represented twice. Once as $0$ and once as $-0$
- Arithmetic is very difficult

== 1's Complement

1's Complement is a way of representing a negative number as the inverse of a positive number. That is, more formally, that $~x_2 = -x_10$, or that the inverse of a number in base 2 is the negative of the number in base 10.

#example(with: false)[]

$00100011_2 = 35_10$

$11011100_2 = -35_10$

=== Pros

- The representation of $0$ and $-0$ is easier to deal with than in sign magnitude
- Arithmetic is much easier

=== Cons

- There are still two representations of $0$
- Arithmetic is still not straight forward

== 2's Complement

2's Complement is the modern approach to representing numbers in binary.

=== Negating Numbers

To negate binary numbers we:

1. Invert the bits
2. Add 1

#example(with: false)[What is $-35_10$ in 2's complement.]

0. $35_10 = 00101100_2$
1. $00101100_2 arrow.r 11011100_2$
2. $00101100_2 + 1_2 = 11011101_2$

So, $-35_10$ is $11011101_2$ in 2's complement binary.

=== Converting 2's Complement to base 10

To revert the process:

1. Check the number is actually negative
2. Invert the bits
3. Add 1
4. Convert to binary

#example(with: false)[Convert 2's complement $11000111_2$ to decimal.]

1. MSB is $1$, so we continue
2. $11000111_2 arrow.r 00111000_2$
3. $00111000_2 + 1_2 = 00111001_2$
4. $00111001_2 = 57$

So, $11000111_2$ is $-57$.
