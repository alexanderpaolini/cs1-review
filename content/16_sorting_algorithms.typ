#import "../lib.typ": example

= Sorting Algorithms

Sorting algorithms are algorithms that solve the sorting problem. That is, more formally, given $n$ unsorted elements, rearrange them in a way such that $x_0 < x_1 < ... < x_n$.

There are two main types of algorithms discussed in CS1. Algorithms that are $O(n^2)$, and algorithms that are $O(n log n)$.

== Selection Sort

Selection sort is, in my opinion, the most naive sorting algorithm. Selection sort *selects* the minimum element each iteration, and swaps it to the correct spot.
#example(with: false)[$[4, 2, 1, 7, 3, 8]$]

0. `[4, 2, 1, 7, 3, 8]`
1. `[1, 2, 4, 7, 3, 8]` - Select 1, swap it with i=0, 4
2. `[1, 2, 4, 7, 3, 8]` - Select 2, swap it with i=1, 2 (no change)
3. `[1, 2, 3, 7, 4, 8]` - Select 3, swap it with i=2, 4
4. `[1, 2, 3, 4, 7, 8]` - Select 4, swap it with i=3, 7
5. `[1, 2, 3, 4, 7, 8]` - Select 7, swap it with i=4, 7 (no change)
6. `[1, 2, 3, 4, 7, 8]` - Select 8, swap it with i=5, 8 (no change)

=== Time Complexity

- *Worst*: $O(n^2)$
- *Best*: $O(n^2)$
- *Average*: $O(n^2)$

Tip: remember that selection sort *selects* the minimum each iteration

== Bubble Sort

Bubble sort is named because the largest element *bubbles* up to the correct position with each iteration. During each pass through the array, adjacent elements are compared, and if they are out of order, they are swapped. This process is repeated until the entire array is sorted.

#example(with: false)[`[4, 2, 1, 7, 3, 8]`]
0. `[4, 2, 1, 7, 3, 8]`
1. `[2, 1, 4, 3, 7, 8]` - 4 swaps with 2; 4 swaps with 1; 7 swaps with 3.
2. `[1, 2, 3, 4, 7, 8]` - 2 swaps with 1; 4 swaps with 3

=== Time Complexity

- Worst: $O(n^2)$
- Best: $O(n)$
- Average: $O(n^2)$

Note: Unlike selection sort, Bubble Sort can be O(n) best case if the array is already sorted.

Tip: remember that in bubble sort, the larger elements *bubble* up.

== Insertion Sort

Insertion sort is similar to both selection sort and bubble sort. Each iteration in insertion sort we add the next element to its correct spot in the new array.

#example(with: false)[`[4, 2, 1, 7, 3, 8]`]

0. [*4*, 2, 1, 7, 3, 8]
1. [*2*, *4*, 1, 7, 3, 8] - 2 is inserted in front of 4
2. [*1*, *2*, *4*, 7, 3, 8] - 1 is inserted in front of 2
3. [*1*, *2*, *4*, *7*, 3, 8] - 7 is inserted behind 4
4. [*1*, *2*, *3*, *4*, *7*, 8] - 3 is inserted between 2 and 4
5. [*1*, *2*, *3*, *4*, *7*, *8*] - 8 is inserted after 7

Tip: remember that insertion sort *inserts* the next element to its correct spot.

=== Time Complexity

- *Worst*: $O(n^2)$
- *Best*: $O(n)$
- *Average*: $O(n^2)$

== Merge Sort

Merge sort is the most simple $O(n \og n)$ sorting algorithm. Merge sort divides the array into 2 portions, sorts them, and merges them.

The drawback with merge sort is that it uses $O(n log n)$ space complexity, so it is very inefficient in that respect.

#example(with: false)[`[4, 2, 1, 7, 3, 8]`]

0. `[4, 2, 1, 7, 3, 8]`
1. `[4, 2, 1]` `[7, 3, 8]` - call 1
2. `[4, 2]` `[1]` `[7]` `[3, 8]` - call 2
3. `[2, 4]` `[1]` `[7]` `[3, 8]` - sort
4. `[1, 2, 4]` `[3, 7, 8]` - merge 1
5. `[1, 2, 3, 4, 7, 8]` - merge 2

*Time Complexity*: $O(n log n)$ \
*Space Complexity*: $O(n log n)$

== Quick Sort

Quick sort is a divide-and-conquer sorting algorithm. It selects a pivot, partitioning the lesser elements to the left, and the greater elements to the right. Then the partitions are merged.

The key advantage of quick sort is that it is in-place (requires very little extra space), unlike merge sort.
#example(with: false)[`[4, 2, 1, 7, 3, 8]`]

0. `[4, 2, 1, 7, 3, 8]`
1. Choose pivot `8` $arrow.r$ Partition: `[4, 2, 1, 7, 3]` `[8]` `[]`
2. Sort `[4, 2, 1, 7, 3]`:
  - Pivot `3` $arrow.r$ `[2, 1]` `[3]` `[4, 7]`
  - Sort `[2, 1]`: `[1, 2]`
  - Sort `[4, 7]`: `[4, 7]`
  - Merge: `[1, 2]` + `[3]` + `[4, 7]` $arrow.r$ `[1, 2, 3, 4, 7]`
3. Merge: `[1, 2, 3, 4, 7]` + `[8]` + `[]` $arrow.r$ `[1, 2, 3, 4, 7, 8]`

*Time Complexity*:

- *Best*: $O(n log n)$
- *Average*: $O(n log n)$
- *Worst Case*: $O(n^2)$ (when pivot is always smallest/largest element)
