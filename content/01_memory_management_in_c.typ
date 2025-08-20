#import "../lib.typ": example, note

= Memory Management in C

Memory Management in C is a review from `COP3223: Intro to C`.

Memory management in C is very simple with regards to this class.

1. `malloc(size_t n)` - Allocates $n$ bytes of memory
2. `free(void *ptr)` - Frees the memory at the pointer specified

#example(with: false)[]

```c
int main()
{
    // Allocate memory
    int *x = malloc(sizeof(int));

    *x = 5;
    printf("x = %d\n", *x);

    // Free the allocated memory
    free(x);

    return 0;
}
```

#note[You would never malloc a primative data type like this.]

#example(with: false)[Allocating a student struct and then doing something with said struct.]

```c
// Basic student struct
typedef struct student_s
{
    char *name;
    double gpa;
} student_t;

void print_student(student_t *s);

int main()
{
    // Allocate memory for student
    student_t *student = (student_t *)malloc(sizeof(student_t));

    // Allocate memory for name; assign name
    student->name = (char *)malloc(sizeof(char) * 20);
    student->name = "Alex";

    print_student(student);

    // Memory must be freed inside-out
    free(student->name);
    free(student);

    return 0;
}
```
