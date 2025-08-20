
= Binary Tree

A Binary Tree is a data structure similar to Linked List, except that it has two children instead of one. There is a left child and a right child.

== Terminology:

- *Node*: The unit of a binary tree, holding some data element
- *Root*: The topmost node in the tree; it has no parent
- *Leaf*: A node that has no children
- *Parent*: A node that has children
- *Child*: A node that is a descendant (left or right) of another node
- *Subtree*: A tree formed from a node and all its descendants
- *Depth*: The number of edges (connections) from the root to the node
- *Height*: The number of edges on the longest path from the node to a leaf

== Types of Binary Trees:

- *Full Binary Tree*: Every node either has 0 or 2 children
- *Complete Binary*: Tree: Every level is completely filled except possibly for the last level
- *Perfect Binary Tree*: All internal nodes have 2 children, and all leaf nodes are at the same level

== Traversing a Binary Tree

There are many ways to traverse a binary tree, or to visit all of the nodes in the tree.

=== In-order

In-order, or left-node-right traverses the left subtree, the node is visited, then the right subtree is traversed.

=== Pre-order

Pre-order is node-left-right, where the node is visited first, and then the left and right are traversed.

=== Post-order

Post-order is left-right-node, where the node is visited last.

=== Level-order (Breadth-First)

Level-order is more complicated than the other three. This traversal goes level by level, right to left.

Starting with the root node in the queue, the top of the queue is popped, the left and right chiidren are added to the queue, and computation (or printing) is done on the last.

==== Code

```c
void bfs(node_t *root)
{
    if (root == NULL)
    {
        return;
    }

    queue_t q;
    init_queue(&q);
    enqueue(&q, root);

    while (!is_empty(&q))
    {
        node_t *current = dequeue(&q);
        printf("%d ", current->data);

        if (current->left)
        {
            enqueue(&q, current->left);
        }
        if (current->right)
        {
            enqueue(&q, current->right);
        }
    }
}
```

== Binary Tree Questions

*Easy*: #link("https://leetcode.com/problems/maximum-depth-of-binary-tree/")[Maximum Depth of Binary Tree (#104)]; #link("https://leetcode.com/problems/invert-binary-tree/")[Invert Binary Tree (#226)]; #link("https://leetcode.com/problems/symmetric-tree/")[Symmetric Tree (#101)]; #link("https://leetcode.com/problems/path-sum/")[Path Sum (#112)]; #link("https://leetcode.com/problems/diameter-of-binary-tree/")[Diameter of Binary Tree (#543)]

*Medium*: #link("https://leetcode.com/problems/binary-tree-level-order-traversal/")[Binary Tree Level Order Traversal (#102)]; #link("https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/")[Construct Binary Tree from Inorder and Postorder Traversal (#106)]; #link("https://leetcode.com/problems/binary-tree-right-side-view/")[Binary Tree Right Side View (#199)]; #link("https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/")[Binary Tree Zigzag Level Order Traversal (#103)]; #link("https://leetcode.com/problems/sum-root-to-leaf-numbers/")[Sum Root to Leaf Numbers (#129)]

*Hard*: #link("https://leetcode.com/problems/binary-tree-maximum-path-sum/")[Binary Tree Maximum Path Sum (#124)]; #link("https://leetcode.com/problems/recover-binary-search-tree/")[Recover Binary Search Tree (#99)]; #link("https://leetcode.com/problems/serialize-and-deserialize-binary-tree/")[Serialize and Deserialize Binary Tree (#297)]; #link("https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/")[All Nodes Distance K in Binary Tree (#863)]
