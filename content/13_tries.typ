= Tries

Tries are special trees that contain letters. Each node can have 26 children, one for each letter. Words are represented as a path from the root to a node flagged as a word.

*Struct Representation*:

```c
#define ALPHABET_SIZE 26

typedef struct trie_s
{
    struct trie_s *children[ALPHABET_SIZE];
    int flag;
} trie_t;
```

== Operations

There are 4 main operations.

1. Insert - Add a word to the dictionary/list
2. Search - Check if a word has been added
3. Starts With - Check if any words start with a given prefix
4. Delete - Remove a given word

=== Insert

Insert adds a word to the list. We do this by iterating down each character in the word. If it is there, we just increment the letter. If it is not, we add the node, and then increment the letter.

*Time Complexity*: $O(n)$, where $n$ is the length of the word

==== C Implementation

```c
void insert(trie_t* root, const char* word)
{
    trie_t* current = root;
    for (int i = 0; word[i] != '\0'; i++)
    {
        int index = word[i] - 'a';
        if (current->children[index] == NULL)
            current->children[index] = createNode();
        current = current->children[index];
    }
    current->flag = 1;
}
```

=== Search

Search checks if a word is in the list. We can iterate down each character -- like in insert -- and return $1$ if we reach the final character and flag is true. If at any point a node doesn't exist, we can return $0$, or if the flag is not true we can return $0$.

*Time Complexity*: $O(n)$, where $n$ is the length of the word

==== C Implementation

```c
int search(trie_t* root, const char* word)
{
    trie_t* current = root;
    for (int i = 0; word[i] != '\0'; i++)
    {
        int index = word[i] - 'a';
        if (current->children[index] == NULL)
            return 0;
        current = current->children[index];
    }
    return current->flag;
}
```

=== Starts With

To check if any word starts with a given prefix, we can traverse down the trie, and return true if the last character is reached.

*Time Complexity*: $O(n)$, where $n$ is the length of the prefix

==== C Implementation

```c
bool starts_with(trie_t* root, const char* prefix)
{
    trie_t* current = root;
    for (int i = 0; prefix[i] != '\0'; i++)
    {
        int index = prefix[i] - 'a';
        if (current->children[index] == NULL)
            return false;
        current = current->children[index];
    }
    return 1;
}
```

=== Delete

Delete removes a word from the trie, and clears the remaining empty nodes. In order to do this we recursively delete the children of each character, and then remove the node if it is empty.

*Time Complexity*: $O(n)$, where $n$ is the length of the word

==== C Implementation

```c
trie_t* delete_word(trie_t* root, const char* word, int depth)
{
    if (!root) return NULL;

    if (word[depth] == '\0')
    {
        root->flag = 0;

        if (is_empty(root))
        {
            free(root);
            return NULL;
        }
        return root;
    }

    int index = word[depth] - 'a';
    root->children[index] = delete_word(root->children[index], word, depth + 1);

    if (is_empty(root) && root->flag == 0)
    {
        free(root);
        return NULL;
    }

    return root;
}
```
