#import "../lib.typ": example

= Hash Tables

Hash Tables are a key-value store of data. Much like how an array stores data with integer keys, hash tables store data with, in theory, any data type as a key.

They way they do this is with a hash function to translate your given data type into an intger key for an underlying array. Typically this also means modding a previously computed value by the size of the array.

#example(
  with: false,
)[Insert ("apple", 7) with the hash function h(x) that returns the sum of all characters c mod 10 (the size of the array).]

Hash "apple" $arrow.r$ $97 + 112 + 112 + 108 + 101$ = $530$ % $10$ = $0$

Array: $[("apple", 7), X, X, X, X, X, X, X, X, X]$

== Collisions

Collisions are when a hash function produces duplicates values. For example, using the above hash function for "apple" and for "appkf" produce the same index. There are a few methods to prevent collisions.

=== Chaining

Chaining solves this issue by saving each value in the underlying array as a linked list and, thus, chains overlap.

#example(
  with: false,
)[Insert ("apple", 7) and ("appkf", 10) with the hash function h(x) that returns the sum of all characters c mod 10.]

Array: $[("apple", 7) -> ("appkf", 10), X, X, ...]$

==== Pros

- Simple to implement
- Handles collisions easily
- Tables can grow father than their underlying array's size

==== Cons

- Slower lookup (worst case $O(n)$)
- Uses more memory than other methods

=== Linear Probing

Linear probing solves this issue in a different way. By incrementing the hash until there is an open slot. To prevent overflow, the hash must once again be modded by the value of the array.

#example(
  with: false,
)[Insert ("apple", 7), ("appkf", 10), and ("appjf", 13) with the hash function h(x) that returns the sum of all characters c mod 10.]

Array: $[("apple", 7), ("appkf", 10), ("appjf", 13), X, X, ...]$

==== Pros

- No extra memory
- Fast with a low load factor

==== Cons

- Deletion is complicated
- Bad performance with a high load factor

=== Quadratic Probing

Quadratic probing is very similar to linear probing, except instead of incrementing by 1, we increment in squares.

#example(
  with: false,
)[Insert ("apple", 7), ("appkf", 10), and ("appjf", 13) with the hash function h(x) that returns the sum of all characters c mod 10.]

Array: $[("apple", 7), ("appkf", 10), X, ("appjf", 13), X, X, ...]$

==== Pros

- Better performance with higher load

==== Cons

- Still relatively complicated for deletion
- More complex than linear probing

== Time Complexity

The time complexity of inserting and retreiving is generally close to $O(1)$. With a large load or a bad hash function, the time complexity can approach $O(n)$ where $n$ is the number of elements.
