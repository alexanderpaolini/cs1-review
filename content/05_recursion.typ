#import "../lib.typ": example

= Recursion

Recursion in programming is when a function calls itself.

```c
void is_recursive()
{
    is_recursive();
}
```

== The General Formula for Recursion

```txt
if this is a simple case
    solve it
else
    redefine the problem using recursion
```

#example[]

```c
void print_numbers(int low, int high)
{
    // Base case
    if (low >= high)
        return;

    printf("%d\n", low);

    // Recursive call
    print_numbers(low + 1, high);
}
```

Recursion is often better suited to solve problems regarding data structures that are recursive in nature, like linked list, trees and tries (see later sections).

Rerusive solutions tend to have one or more cases with a straight forward solution while the other cases can be reduced to a combination of aforementioned straight forward solutions, or a single one of those cases.

== Pros and Cons of Recursion

=== Pros

1. Simplfies code
2. Natural fit for some problems
3. Reduces the length of code

=== Cons

1. Higher memory overhead than iterative solutions
2. Can be difficult to debug
3. Performance overhead incurred through many recursive calls
4. Recursion is not always intuitive

== Types of Recursion

There are two main types of recursion

=== Direct Recursion

In Direct Recursion the function calls itself *directly*.

```c
void print_numbers(int n) {
    if (n == 0)
        return;

    printf("%d ", n);

    print_numbers(n - 1);
}
```

=== Indirect Recursion

In Indirect Recursion the function calls another, which calls itself.

```c
void fn(int n) {
    if (n > 5) return;
    printf("%d ", n);
    fn2(n + 1);
}

void fn2(int n) {
    if (n > 5) return;
    printf("%d ", n);
    fn(n + 1);
}
```
