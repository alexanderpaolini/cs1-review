#import "../lib.typ": example, problem

= Algorithm Design

Algorithm Design is the process of creating efficient algorithms. There are many approaches to doing so. By using order analysis to compare different algorithms, we can design the one to best fit our needs.

== The Searching Problem

The searching problem is as follows:

#problem[Given a list of unique items (assume size = n), find the index of a specific item.]

=== Linear Search

Linear Search is the most basic search. The idea is to check every element, returning when we find the one we need.

#example[Where is the element `5` in the array `[1, 2, 3, 4, 5, 6, 7]`]

1. At `i = 0`, `arr[0] = 1`. `1 != 5`. Continue
2. At `i = 1`, `arr[1] = 2`. `2 != 5`. Continue
3. At `i = 2`, `arr[2] = 3`. `3 != 5`. Continue
4. At `i = 3`, `arr[3] = 4`. `4 != 5`. Continue
5. At `i = 4`, `arr[4] = 5`. `5 == 5`.

We found the element at index `4`.

```c
int search(int *arr, int target, int n)
{
    for (int i = 0; i < n; i++)
        if (arr[i] == target)
            return i;
    return -1; // DNE
}
```

This approach works fine, but with certain constraints it proves inefficient.

=== Binary Search

Binary Search is the idea of starting from the middle, and using that value to determine what to do next. If you found target, return the index. If it is smaller than the target, do binary search on the left half. If it is bigger than the target, do binary search on the right half.

This approach is much like searching a dictionary. You wouldn't search each word one by one, you would check a random page and see if you went too far. Only the page would be half way through, and not the middle.

#example[Where is the element `5` in the array `[1, 2, 3, 4, 5, 6, 7]` using Binary Search?]

1. Set `low = 0` and `high = 6`
2. Calculate `mid = (low + high) // 2`, so `mid = 3` (index of element `4`).
At `mid = 3`, `arr[3] = 4`. `4 != 5`. Since `5 > 4`, adjust `low = mid + 1 = 4`.

3. Recalculate `mid = (4 + 6) // 2`, so `mid = 5` (index of element `6`).
At `mid = 5`, `arr[5] = 6`. `6 != 5`. Since `5 < 6`, adjust `high = mid - 1 = 4`.

4. Recalculate `mid = (4 + 4) // 2`, so `mid = 4` (index of element `5`).

At `mid = 4`, `arr[4] = 5`. `5 == 5`.

We found the element at index `4` and required fewer steps than linear search.

Linear search checks every element of the array. We can represent that as $sum_(i=0)^(n) 1$, which simplifies to $n$. Binary search is a bit more complicated to get the closed form solution of (See Recurrence Relations), but because we split the size in half each time, the time complexity is $log(n)$.

For a small input size, binary search might not be much more efficient, but as n grows larger, binary search becomes much more efficient.

== The Sorted Arrays Matching Problem

#problem[Given 2 *sorted* arrays, determine all of the values found in both arrays.]

The naive approach would be to check every element in the first array against every element in the second array. In other words, $O(n*m)$ where $n$ is the length of one array, and $m$ is the length of another array. This grows far too fast with the size of the input.

A more efficient approeach would be to check if every element in the first array is in the second array using binary search. This is much better with a time complexity of $n log(m)$. However, we can still do better.

=== The Linear Approeach

Because these arrays are sorted, we can iterate through both of them at the same time. Let $i$ be the index of the first array and $j$ be the index of the second array. If `array1[i] == array2[j]` then we know they match, so we can incremet our counter and both index variables. Otherwise, we can just increment the lower one. We can do this until we reach the end of one of the arrays. The new time complexity is $O(n+m)$
