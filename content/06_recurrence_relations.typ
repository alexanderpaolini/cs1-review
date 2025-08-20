#import "../lib.typ": example
= Recurrence Relations

Recurrence relations are equations that describe the time complexity of recursive algorithms in terms of smaller inputs.

#example[]

$$
T(n) = T(n - 1) + c
$$

In order to find the time complexity of a recursive function in Big-Oh notation, you must take a recurrence relation and turn it into a closed form solution.

== Solving Recurrence Relations using the Iteration Method

Solving recurrence relations can be difficult, but is pretty simple.

The steps are as follows:

1. Iterate T(n) 3 times
2. Solve for the base case = k
3. Substitute in to the kth case

#example[ $T(n) = T(n-1) + 4$ and $T(0) = 1$ ]

#table(
  columns: 2,
  stroke: 1pt,
  inset: 10pt,

  [K], [T(n)],

  [1], [$T(n-1) + 4$],
  [2], [$T(n-2) + 4 + 4$],
  [3], [$T(n-3) + 4 + 4 + 4$],
  [⋮], [⋮],
  [k], [$T(n-k) + 4k$],
)

Where:

$T(n-1) = T(n-2) + 4$

$T(n-2) = T(n-3) + 4$

And we're looking for the base case, so: $n-k=0 arrow.r n=k$

$$T(n) = T(n-k) + 4k$$
$$T(n) = T(n-n) + 4n$$
$$T(n) = T(0) + 4n$$

So,

$$T(n) = 4n + 1$$

In other words, the Big-Oh notation is $O(n)$

#example[ $T(n) = 2T(n/2) + 6$ and $T(1) = 9$ ]

#table(
  columns: 2,
  stroke: 1pt,
  inset: 10pt,

  [K], [T(n)],

  [1], [$2T(n/2) + 6$],
  [2], [$2[2T(n/4) + 6] + 6 = 4T(n/4) + 12 + 6$],
  [3], [$4[2T(n/8) + 6] + 18 = 8T(n/8) + 24 + 6$],
  [⋮], [⋮],
  [k], [$2^k T(n/2^k) + 6(2^k - 1)$],
)

Now, $n/2^k = 1 arrow.r k = log_2 n$.

So we substitute:

$$T(n) = 2^k T(n/2^k) + 6(2^k - 1)$$
$$T(n) = 2^{\log_2 n} T(1) + 6(2^{\log_2 n} - 1)$$
$$T(n) = n T(1) + 6(n - 1)$$
$$T(n) = 9n + 6(n - 1) = $$

So,

$$T(n) = 15n - 6$$

This means that the Big-Oh notation is $O(n)$.

