#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    // Checks if the memory location of main is >=
    printf(1, "XV6_TEST_OUTPUT %d\n", (int)main >= 0x1000);
    exit();
}
