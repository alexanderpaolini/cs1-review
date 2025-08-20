#import "../lib.typ": example, note

= Stacks

Stacks are a data structure that is *Last in, Last Out* or LIFO. This means the last element pushed to the stack is at the top of the stack.

In c specifically, there are multiple ways to implement a stack. My preference would be as such:

```c
#define MAX 100
typedef struct stack_s {
    int items[MAX];
    int top;
} stack_t;
```

where the integer top represents which index the top of the stack is at. An index of `-1` means it is empty. An index of `99`, or `MAX - 1` means it is full.

To Push: increment top and set `items[top] = data`
To Retreive: return `items[top]`
To Pop: decrement top

== Reverse Polish Notation (RPN)

Reverse Polish Notation, or postfix notation is a way of representing mathematical equations. Instead of writing `1 + 1`, you would write `1 1 +`.

=== Evaluating RPN

To evaluate RPN, you do the following algorithm:

1. Scan tokens left to right
2. If the token is a number, push to stack
3. If the token is an operator:
  - Pop two numbers from the stack
  - Apply the operator
  - Push the result back to the stack
4. At the end, the result is on the top of the stack.

#example(with: false)[`3 4 + 2 *`]

*Step 1*:

```txt
3 4 + 2 *
|
```

Stack: [3]

Add 3 to stack

*Step 2*:

```txt
3 4 + 2 *
  |
```

Stack: [3, 4]

Add 4 to stack

*Step 3*:

```txt
3 4 + 2 *
    |
```

Stack: [7]

Pop 3 and 4

Add them (the operator is a `+`)

Push the sum (`7`) to the stack

*Step 4*:

```txt
3 4 + 2 *
      |
```

Stack: [7, 2]

Push 2 to the stack

*Step 5*:

```txt
3 4 + 2 *
        |
```

Stack: [14]

Pop 7 and 2 from the stack

Multiply them (the operator is a `*`)

Push the product (`14`) to the stack


== Code for Stacks

=== Initiation

```c
void init(stack_t *s)
{
    s->top = -1;
}
```

=== Is Empty

```c
int is_empty(stack_t *s)
{
    return s->top == -1;
}
```

=== Is Full

```c
int is_full(stack_t *s)
{
    return s->top == MAX - 1;
}
```

=== Push

```c
void push(stack_t *s, int val)
{
    if (is_full(s))
    {
        // Stack is full and cannot be added to
        exit(1);
    }
    s->items[++s->top] = val;
}
```

=== Pop

```c
int pop(stack_t *s)
{
    if (is_empty(s))
    {
        // Stack is empty and cannot be popped from
        exit(1);
    }
    return s->items[s->top--];
}
```

== Stack Questions

*Easy*:
#link("https://leetcode.com/problems/valid-parentheses/")[Valid Parentheses (#20)];
#link("https://leetcode.com/problems/min-stack/")[Min Stack (#155)];
#link("https://leetcode.com/problems/implement-stack-using-queues/")[Implement Stack using Queues (#225)]

*Medium*:
#link("https://leetcode.com/problems/evaluate-reverse-polish-notation/")[Evaluate Reverse Polish Notation (#150)];
#link("https://leetcode.com/problems/next-greater-element-i/")[Next Greater Element I (#496)];
#link("https://leetcode.com/problems/next-greater-element-ii/")[Next Greater Element II (#503)];
#link("https://leetcode.com/problems/daily-temperatures/")[Daily Temperatures (#739)];
#link("https://leetcode.com/problems/asteroid-collision/")[Asteroid Collision (#735)];
#link("https://leetcode.com/problems/binary-tree-inorder-traversal/")[Binary Tree Inorder Traversal (#94)]

*Hard*:
#link("https://leetcode.com/problems/largest-rectangle-in-histogram/")[Largest Rectangle in Histogram (#84)];
#link("https://leetcode.com/problems/basic-calculator/")[Basic Calculator (#224)];
#link("https://leetcode.com/problems/basic-calculator-ii/")[Basic Calculator II (#227)];
#link("https://leetcode.com/problems/basic-calculator-iii/")[Basic Calculator III (#772)]
