#import "../lib.typ": example, note

= Linked Lists

Linked lists are data types that contain data of any time and a pointer to the next data.

*C Implementation*:

```c
typedef struct node_s
{
    int val;
    node_t *next;
} node_t;
```

Linked lists have a head -- the first element in the list, and a tail -- the last element in the list.

#example(with: false)[`1 -> 2 -> 3 -> 4`]

Where 1 is the head and 4 is the tail.

== Types of Linked Lists

=== Singly Linked Lists

These are the default linked list. They only contain a pointer to the next data point.

=== Circular Linked Lists

Much like their name implies, circular linked lists create a circle where the last node points to the head node.

#example(with: false)[`1 -> 2 -> 3 -> 4 -> 1`]

=== Doubly Linked Lists

Doubly linked lists contain two pointers, a *next* and a *prev*.

```c
typedef struct node_s
{
    int val;
    node_t *next;
    node_t *prev;
} node_t;
```

#example(with: false)[`1 <-> 2 <-> 3 <-> 4`]

=== Circular Doubly Linked Lists

Thses lists are no different from regular doubly linked lists, except the tail points back to the head.

#example(with: false)[`4 <- 1 <-> 2 <-> 3 <-> 4 -> 1`]

Next points to the next element in the list.
Prev poinst to the previous element in the list.

== Pros and Cons

=== Pros

1. Dynamic *as fuck*!
2. Simple to modify
3. Can be insrted however (unlike static arrays)

=== Cons

1. O(n) Access
2. O(n) Delete
3. O(n) Append

#note[Append can be O(1) depending on the method and implementation.]

== Common Implementations of Functions

=== Create Node

```c
node_t *create_node(int data)
{
    node_t *new_node = (node_t *)malloc(sizeof(node_t));
    if (new_node != NULL)
    {
        new_node->data = data;
        new_node->next = NULL;
    }
    return new_node;
}
```

=== Is Empty

```c
int is_empty(node_t *head)
{
    return head == NULL;
}
```

=== Insert (head)

```c
node_t *insert_head(node_t *head, int data)
{
    node_t *new_node = create_node(data);
    if (new_node != NULL)
    {
        new_node->next = head;
    }
    return new_node;
}
```

=== Insert (tail)

```c
node_t *insert_tail(node_t *head, int data)
{
    if (head == NULL)
    {
        return create_node(data);
    }
    head->next = insert_tail(head->next, data);
    return head;
}
```

=== Delete

```c
node_t *delete(node_t *head, int data)
{
    if (head == NULL)
    {
        return NULL;
    }
    if (head->data == data)
    {
        node_t *temp = head;
        head = head->next;
        free(temp);
        return head;
    }
    head->next = delete (head->next, data);
    return head;
}
```

=== Display

```c
void display(node_t *head)
{
    if (head == NULL)
    {
        printf("\n");
        return;
    }
    printf("%d -> ", head->data);
    display(head->next);
}
```

=== Search

```c
node_t *search(node_t *head, int data)
{
    if (head == NULL)
    {
        return NULL;
    }
    if (head->data == data)
    {
        return head;
    }
    return search(head->next, data);
}
```

=== Free

```c
void free_list(node_t *head)
{
    if (head == NULL)
    {
        return;
    }
    free_list(head->next);
    free(head);
}
```
