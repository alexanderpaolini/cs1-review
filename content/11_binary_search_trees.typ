#import "../lib.typ": example, note

= Binary Search Trees (BSTs)

Binary Search Trees are special binary trees. In a binary search tree, the left child is less than the root, and the right child is greater than the root.

#example(with: false)[]

```txt
       8
     /   \
    3     10
   / \      \
  1   6     14
     / \    /
    4   7  13
```

#table(
  columns: 2,
  stroke: 1pt,
  inset: 10pt,

  [Node], [Check],

  [8], [3 < 8 < 10],
  [3], [1 < 3 < 6],
  [6], [4 < 6 < 7],
  [10], [10 < 14],
  [14], [13 < 14],
)

== BST Operations

The main BST operations are Search, Insert, Delete, and Traverse

=== Search

A BST search involves repeatedly searching subtrees, not too dissimlar to a binary search.

==== Time Complexity

- Worst: $O(n)$ -- The entire tree could consist of only right or left children requiring that the entire tree be searched.
- Best: $O(1)$
- Average: $O(log_2 n)$

=== Insert

A BST Insert adds a new value to the BST. In order to do this, you must recursively go down the tree. Go left if the value is less than the node, and right if the value is greater than the node.

==== Code

```c
node_t* insert(node_t* root, int val)
{
    if (root == NULL) return create_node(val);
    if (val < root->data)
        root->left = insert(root->left, val);
    else if (val > root->data)
        root->right = insert(root->right, val);
    return root;
}
```

=== Delete

A Deletion from a BST is slightly more complicated. First, the value must be found. Then, it must be replaed with the inorder successor (which is the min of the right subtree).

==== Code

```c
node_t* find_min(node_t* root) {
    while (root->left != NULL) root = root->left;
    return root;
}

node_t* delete(node_t* root, int val) {
    if (root == NULL) return NULL;
    if (val < root->data)
        root->left = delete(root->left, val);
    else if (val > root->data)
        root->right = delete(root->right, val);
    else {
        // One child or no child
        if (root->left == NULL) {
            node_t* temp = root->right;
            free(root);
            return temp;
        } else if (root->right == NULL) {
            node_t* temp = root->left;
            free(root);
            return temp;
        }
        // Two children: get inorder successor (min in right subtree)
        node_t* temp = find_min(root->right);
        root->data = temp->data;
        root->right = delete(root->right, temp->data);
    }
    return root;
}
```

=== Traverse

Traversal of the BST is the same as the traversal of a regular Binary Tree except the in-order traversal of a BST is sorted. This is because the left is less than the node, and the right is greater than the node.

== Binary Search Tree (BST) Questions

*Easy*: #link("https://leetcode.com/problems/search-in-a-binary-search-tree/")[Search in a Binary Search Tree (#700)]; #link("https://leetcode.com/problems/validate-binary-search-tree/")[Validate Binary Search Tree (#98)]; #link("https://leetcode.com/problems/minimum-absolute-difference-in-bst/")[Minimum Absolute Difference in BST (#530)]; #link("https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/")[Convert Sorted Array to BST (#108)]

*Medium*: #link("https://leetcode.com/problems/delete-node-in-a-bst/")[Delete Node in a BST (#450)]; #link("https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/")[Lowest Common Ancestor of a BST (#235)]; #link("https://leetcode.com/problems/trim-a-binary-search-tree/")[Trim a Binary Search Tree (#669)]; #link("https://leetcode.com/problems/convert-bst-to-greater-tree/")[Convert BST to Greater Tree (#538)]; #link("https://leetcode.com/problems/closest-binary-search-tree-value/")[Closest Binary Search Tree Value (#270)]

*Hard*: #link("https://leetcode.com/problems/recover-binary-search-tree/")[Recover Binary Search Tree (#99)]; #link("https://leetcode.com/problems/count-of-smaller-numbers-after-self/")[Count of Smaller Numbers After Self (#315)]; #link("https://leetcode.com/problems/maximum-sum-bst-in-binary-tree/")[Maximum Sum BST in Binary Tree (#1373)]
