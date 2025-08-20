#import "../lib.typ": example

= Bit Masking

Bit masking is a technique to manipulate bits of a binary number. We use bitwise operators (see above) with a "mask". A mask is a set of bits that indicate what should be modified.

Numbers can be thought as sets of bits. Manipulating these bits through bitwise shifts and comparison operators provides the bits we are looking for.

Tip: In C, we can use the format $"0bXXXX"$, where X is either a one or zero, to write binary numbers.

#example(with: false)[Check if a number $n$ has bits $5$, $6$, and $7$ set.]

We can do $(n >> 5)$ $\&$ $"0b111"$ == $"0b111"$.

== Types of Bit Masks

1. Setting to 1 - Use the `OR` operator `|` with a $1$
2. Setting to 0 - Use the `AND` operator `&` with a $0$
3. Toggling bits - Use the `XOR` to flip or invert specific bits
4. Checking bits - Use the `AND` operator to check specific bits

#example(with: false)[Student Information]

A student is stored as an 8 bit number where:

- *Bit 1*: Student has a library card (1 if true, 0 if false)
- *Bit 2*: Student is enrolled in a course (1 if true, 0 if false)
- *Bit 3*: Student has completed an internship (1 if true, 0 if false)
- *Bit 4*: Student is a graduate (1 if true, 0 if false)
- *Bit 5*: Student is a part-time student (1 if true, 0 if false)
- *Bit 6*: Student has a scholarship (1 if true, 0 if false)
- *Bit 7*: Student is a member of a club (1 if true, 0 if false)
- *Bit 8*: Student is in good academic standing (1 if true, 0 if false)

=== Questions

1. Write a function to check if a student has a library card.
2. Write a function to check if a student is an A tier student (has a scholarship, is in good academic standing, and is enrolled in a course)

=== Answers

*1.*

```c
int has_library_card(unsigned char student_info)
{
    // Check if bit 1 (least significant bit) is set to 1
    return (student_info & (1 << 0)) != 0;
}
```

*2.*

```c
int is_a_tier_student(unsigned char student_info)
{
    // Check if the student is enrolled in a course (bit 2), has a scholarship (bit 6), and in good academic standing (bit 8)
    return (student_info & (1 << 1)) &&  // Check if bit 2 (enrolled) is 1
           (student_info & (1 << 5)) &&  // Check if bit 6 (scholarship) is 1
           (student_info & (1 << 7));    // Check if bit 8 (good academic standing) is 1
}
```
