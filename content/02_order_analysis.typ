#import "../lib.typ": example

= Order Analysis

Order Analysis is the way in which we categorize the efficienty of algorithms in terms of its input.

We generally use Big-Oh notation, where the runtime of a piece of code is $O(x)$, which is said as "Big-Oh of x", or "Order x".

Common runtimes include:

1. $O(1)$ - Constant runtime
2. $O(log(n))$ - Logarithmic runtime
3. $O(n)$ - Linear runtime
4. $O(n log(n))$ - Linearithmic runtime
5. $O(n^2)$ - Quadratic runtime
6. $O(n^c)$ - Polynomial time complexity
7. $O(2^n)$ - Exponential time complexity
8. $O(n!)$ - Factorial

In Big-Oh notation, we focus only on the general shape of the growth curve, ignoring constants and lower-order terms. For instance, if a runtime is expressed as $T_1n^3 + T_2n^2 + T_1$, we simplify it to $O(n^3)$. This is because the highest-degree term dominates the growth, and Big-Oh captures only the rough upper-bound behavior, not the exact details.

#example[Find the Big-Oh notation of a function with the runtime of $T(n) = 5n^2 + 3n + 10$]

We ignore the coefficients and lower-order terms, focusing only on the dominant term. The highest-order term is $n^2$, so the Big-Oh notation is: $O(n^2)$

#example[Find the Big-Oh notation of a function with the runtime of $T(n) = 4n^3 + 100n log n + 600$]

Again, the $n^3$ term dominates the growth as $n$ gets large. So the Big-Oh notation is: $O(n^3)$
