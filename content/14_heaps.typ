#import "../lib.typ": example

= Heaps

A heap (separate from the heap in memory) is a form of a tree -- represented internally as an array -- that satisfies the heap property. The heap property is the rule that every parent node is *less than or equal*\/*greater than or equal* to its children for min-heaps and max-heaps respectively.

Heaps are complete binary trees (see Binary Tree unit). This means that all levels of the tree are filled except the last, and it is filled from left to right.

== Array Representation

Heaps are represented internally as an array instead of the traditional tree data structure. Node $i$ has children at index $2i + 1$ and $2i + 2$.

#example(with: false)[]

```txt
         3
       /   \
      11    5
     / \   /
   10  7  6
```

Array: $[3, 11, 5, 10, 7, 6]$

Node $1$ (11) has children at index $3$ (10) and $4$ (11).

== Why?

Heaps are an implementation of a priority queue, where the smallest/largest element can be accessed efficiently.

=== Time Complexity

- Insert: $O(log n)$
- Extract max/min: $O(log n)$
- Peek max/min: $O(1)$

== Creating Heaps

=== Heapify

The heapify function swaps around the values of the current node and its children so that it satisfies the heap property. If one of the children gets swapped with the parent, the heapify function must also be called on the child that was swapped so that it continues to satisfy the heap property.

#example(with: false)[]

Before heapify call on $3$:

```txt
         3
       /   \
      11    5
     / \   /
   10  7  6
```

After first heapify:

```txt
        11
       /  \
      3    5
     / \   /
   10  7  6
```

Notice how $3$ doesn't satisfy the max-heap property.

After second heapify:

```txt
        11
       /  \
      10   5
     / \   /
    3   7 6
```

=== Building a Heap

The main way discussed in CS1 to build a heap is the bottom up method. This means to perform the heapify function from an unsorted array from the last non-lead node up to the root.

#example(with: false)[Build a min-heap with the unsorted array $[9, 4, 7, 1, -2, 6, 5]$]

#table(
  columns: 3,
  stroke: 1pt,
  inset: 10pt,

  [Step], [Array], [Reason],

  [0], [$[9, 4, 7, 1, -2, 6, 5]$], [Initial unsorted array],
  [1], [$[9, 4, 5, 1, -2, 6, 7]$], [Heapify node $2$ (7). Swap 5 and 7],
  [2], [$[9, -2, 5, 1, 4, 6, 7]$], [Heapify node $1$ (4). Swap 4 and -2],
  [3], [$[-2, 9, 5, 1, 4, 6, 7]$], [Heapify node $0$ (9). Swap 9 and -2. 9 no longer satisfies heap property],
  [4], [$[-2, 1, 5, 9, 4, 6, 7]$], [Heapify node $1$ (9). Swap 9 and 1],
)

=== Heap Sort

Heap sort is a sorting algorithm (see sorting algorithms). It builds a heap and then repeatedly swaps the root (min/max) with the last element and reducing the heap size, maintaining the heap property each time.

Heap sort is in-pace (no extra memory) and is always $O(n log n)$.

#example(with: false)[$[4, 2, 1, 7, 3, 8]$]

0. $[4, 2, 1, 7, 3, 8]$
1. *Build Max-Heap*:
  - Heapify from last non-leaf $arrow.r$ first
  - After heapify: $[8, 4, 1, 2, 3, 7]$
2. *Sort*:
  - Swap root with last: $[7, 4, 1, 2, 3, 8]$
    Heapify: $[4, 3, 1, 2, 7, 8]$
  - Swap: $[2, 3, 1, 4, 7, 8]$
    Heapify: $[3, 2, 1, 4, 7, 8]$
  - Swap: $[1, 2, 3, 4, 7, 8]$
    Heapify: $[2, 1, 3, 4, 7, 8]$
  - Keep going until fully sorted: $[1, 2, 3, 4, 7, 8]$

== Heap Code

```c
void heapify(int arr[], int n, int i)
{
    int smallest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] < arr[smallest])
        smallest = left;

    if (right < n && arr[right] < arr[smallest])
        smallest = right;

    if (smallest != i)
    {
        swap(&arr[i], &arr[smallest]);
        heapify(arr, n, smallest);
    }
}

void build_heap(int arr[], int n)
{
    for (int i = n / 2 - 1; i >= 0; i--)
    {
        heapify(arr, n, i);
    }
}
```
