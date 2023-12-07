#include <stdio.h>
#include <stdlib.h>

// Structure to hold grayscale pixel data
typedef struct {
    unsigned char value;
} PixelGray;

// Function to read a PGM image into a 2D array
PixelGray** readPGM(const char* filename, int* width, int* height)
{
    FILE* fp = NULL;
    fp = fopen(filename,"r");
    if (fp == NULL) { printf("unable to open file\n"); exit(-1); }
    
    fgetc(fp); fgetc(fp); fgetc(fp); 
    fscanf(fp, "%d", width); fscanf(fp, "%d", height);
    fgetc(fp); fgetc(fp); fgetc(fp); fgetc(fp); fgetc(fp);


    PixelGray** matrix = (PixelGray**)malloc(*width * sizeof(PixelGray*));
    if (matrix == NULL) { printf("unable to allocate rows\n"); exit(-1); }

    for (int i = 0; i < *width; ++i) {
        matrix[i] = (PixelGray*)malloc(*height * sizeof(PixelGray));
        if (matrix[i] == NULL) { printf("unable to allocate for columns in row %d\n", i); exit(-1); }
    }

    // put bytes from image into matrix
    for (int i = 0; i < *width; ++i) {
        for (int j = 0; j < *height; ++j) {
            //matrix[i][j].value = 0;
            fread(&matrix[i][j].value, 1, 1, fp);
        } 
    }
    printf("%c\n", matrix[0][0].value);
    printf("%c\n", matrix[511][511].value);
    return matrix;
}

// Function to write a 2D matrix as a PGM image
void writePGM(const char* filename, PixelGray** matrix, int* width, int* height) 
{
    FILE* fp = fopen(filename, "w");
    if (!fp) { printf("unable to open file\n"); exit(-1); }

    int count = 0;

    // file header
    fprintf(fp, "P5\n%d %d\n255\n", *width, *height);
    // put bytes from image into matrix
    for (int i = 0; i < *width; ++i) {
        for (int j = 0; j < *height; ++j) {
            fwrite(&matrix[i][j].value, 1, 1, fp);
           // printf("%c\n", matrix[i][j].value);
            ++count;
        } 
    }
    printf("%d\n", count);
}

// Function to threshold the image matrix
PixelGray** threshold(PixelGray** matrix, int* width, int* height)
{
    PixelGray** new_matrix = (PixelGray**)malloc(*width * sizeof(PixelGray*));
    if (new_matrix == NULL) { printf("unable to allocate rows\n"); exit(-1); }

    for (int i = 0; i < *width; ++i) {
        new_matrix[i] = (PixelGray*)malloc(*height * sizeof(PixelGray));
        if (new_matrix[i] == NULL) { printf("unable to allocate for columns in row %d\n", i); exit(-1); }
    }

    for (int i = 0; i < *width; ++i) {
        for (int j = 0; j < *height; ++j) {
            if (matrix[i][j].value > 80) {
                new_matrix[i][j].value = 255;
            } else {
                new_matrix[i][j].value = 0;
            }
        } 
    }
    return new_matrix;
}

// Function to rotate the image matrix
PixelGray** rotate(PixelGray** matrix, int* width, int* height)
{
    PixelGray** new_matrix = (PixelGray**)malloc(*width * sizeof(PixelGray*));
    if (new_matrix == NULL) { printf("unable to allocate rows\n"); exit(-1); }
    for (int i = 0; i < *width; ++i) {
        new_matrix[i] = (PixelGray*)malloc(*height * sizeof(PixelGray));
        if (new_matrix[i] == NULL) { printf("unable to allocate for columns in row %d\n", i); exit(-1); }
    }

    for (int i = 0; i < *width; ++i) {
        for (int j = 0; j < *height; ++j) {
            new_matrix[i][j].value = matrix[j][i].value;
        } 
    }
    return new_matrix;
}


//main function - DO NOT MODIFY
int main() {
    int width, height;  // variable to hold width and height. Use reference in other functions

    PixelGray** image_original = readPGM("lenna.pgm", &width, &height);
    // Now you have the grayscale image data in the 'image_original' 2D array
    writePGM("original.pgm", image_original, &width, &width);
    // Access pixel data using image[row][col].value
    // For example, to access the pixel at row=2, col=3:
    // unsigned char pixel_value = image[2][3].value;

    // Create a new 2D array 'image_thresh' to store the threshold image
    PixelGray** image_thresh = threshold(image_original, &width, &height);
    //write the image data as "threshold.pgm"
    writePGM("threshold.pgm", image_thresh, &width, &height);

    // Create a new 2D array 'image_rotate' to store the rotated image
    PixelGray** image_rotate = rotate(image_original, &width, &height);
    //write the image data as "rotate.pgm"
    writePGM("rotate.pgm", image_rotate, &width, &height);

    image_rotate = rotate(image_rotate, &width, &height);
    //write the image data as "rotate_again.pgm"
    writePGM("rotate_again.pgm", image_rotate, &width, &height);

    // Free the allocated memory when you're done
    for (int i = 0; i < height; ++i) {
        free(image_original[i]);
        free(image_thresh[i]);
        free(image_rotate[i]);
    }
    free(image_original);
    free(image_thresh);
    free(image_rotate);
    return 0;
}
