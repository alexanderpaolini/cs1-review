#import "../lib.typ": example, note

= Queues

Queues are the opposite of stacks -- they follow a *First in, First Out*, or FIFI, pattern. That is, the first element added to the queue is the first one to be removed.

The queue structure would be as follows:

```c
#define MAX 100

typedef struct {
    int items[MAX];
    int front, rear, size;
} queue_t;
```

The integer front points to the front element of the queue. Rear points to the last element of the queue, and size contains the number of elements in the queue.

== Code for Queues

=== Initiation

```c
void init(queue_t *q)
{
    q->front = 0;
    q->rear = -1;
    q->size = 0;
}
```

=== Is Empty

```c
int is_empty(queue_t *q)
{
    return q->size == 0;
}
```

=== Is Full

```c
int is_full(queue_t *q)
{
    return q->size == MAX;
}
```

=== Enqueue

```c
void enqueue(queue_t *q, int val)
{
    if (is_full(q))
    {
        // Queue is full and cannot be added to
        exit(1);
    }
    q->rear = (q->rear + 1) % MAX;
    q->items[q->rear] = val;
    q->size++;
}
```

=== Dequeue

```c
int dequeue(queue_t *q)
{
    if (is_empty(q))
    {
        // Queue is empty and cannot be dequeued from
        exit(1);
    }
    int val = q->items[q->front];
    q->front = (q->front + 1) % MAX;
    q->size--;
    return val;
}
```

== Queue Questions

*Easy*: #link("https://leetcode.com/problems/implement-queue-using-stacks/")[Implement Queue using Stacks (#232)]; #link("https://leetcode.com/problems/number-of-recent-calls/")[Number of Recent Calls (#933)]; #link("https://leetcode.com/problems/moving-average-from-data-stream/")[Moving Average from Data Stream (#346)]

*Medium*: #link("https://leetcode.com/problems/rotting-oranges/")[Rotting Oranges (#994)]; #link("https://leetcode.com/problems/course-schedule/")[Course Schedule (#207)]; #link("https://leetcode.com/problems/perfect-squares/")[Perfect Squares (#279)]; #link("https://leetcode.com/problems/open-the-lock/")[Open the Lock (#752)]; #link("https://leetcode.com/problems/dota2-senate/")[Dota2 Senate (#649)]

*Hard*: #link("https://leetcode.com/problems/sliding-window-maximum/")[Sliding Window Maximum (#239)]; #link("https://leetcode.com/problems/lfu-cache/")[LFU Cache (#460)]; #link("https://leetcode.com/problems/the-maze-ii/")[The Maze II (#505)]
