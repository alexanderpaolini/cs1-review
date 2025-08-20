#import "../lib.typ": example
= Summations

Summations, with respect to this class, are a way to construct runtime. They are defined with the sigma character $sum$.

#example[The sum of all integers from 0 to 10 -- $sum_(i=0)^(10) i$]

Summations are very similar to for loops in programming:

```c
int sum = 0;
for (int i = 0; i <= 10; i++)
    sum += i;
```

#example[Use summations to find out how many times this print statement executes]

```c
for (int i = 0; i < 5; i++)
    printf("i = %d\n", i);
```

This starts at 0; Goes to 4; and adds 1 each iteration. So we can say it runs $sum_(i=0)^4 1$ = 4 times.

== Closed Form Solutions of Summations

Summations can be solved to create a closed form. This is how we can translate from our for loops to Big-Oh notation. Some basic solutions include:

1. `Arithmetic Series` - $S_n = n/2 ((2a + (n-1) d)$.
2. `Sum of Squares` - $sum_(i=1)^(n) i^2 = (n(n+1))/(2n+1))(6)$.
3. `Sum of Cubes` - $sum_(i=1)^(n) i^3 = n(n+1)/2^2$.
4. `Geometric Series` - $S_n = (a(1 - r^n))/(1 - r)$.

== Summation Manipulations

Oftentimes we will need to manipulate our summations to create closed form solutions that we already know.

1. $sum c a_k = c sum a_k$

2. $sum (a_k + b_k) = sum a_k + sum b_k$

3. $sum a_k x^(i+k) = x^i sum a_k x^k$

4. $sum_(m)^(n) a_(k+i) = sum_(m+i)^(n+i) a_k$

5. $sum_1^n (a_k - a_(k-1)) = a_n - a_0$ or $sum_(1)^(n) (a_(k-1) - a_k) = a_0 - a_n$
