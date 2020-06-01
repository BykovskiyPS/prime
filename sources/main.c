#include <stdio.h>
#include <stdlib.h>
#include <prime.h>

// extern void PrimeNumbers(int count);

int main(int argc, char* argv[]) {
    if(argc != 2) {
        printf("Error: enter one number");
        exit(1);
    }
    PrimeNumbers(atoi(argv[1]));
    return 0;
}
