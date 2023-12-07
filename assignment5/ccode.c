#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
    if (argc < 2) {
        printf("Missing number args.\n");
        exit(1);
    }

    size_t arr_size = argc-1;

    int* arr = (int*) malloc(arr_size * sizeof(int));
    if (!arr) { printf("Error allocating array."); exit(1); }

    for (int i = 1; i < argc; i++) {
        arr[i-1] = atoi(argv[i]);
    }
    for (int i = 0; i < arr_size; i++) {
        arr[i]++;
        printf("%d ", arr[i]);
    }
    printf("\n");
    free(arr);
}
