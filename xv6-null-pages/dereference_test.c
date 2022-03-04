#include <stdio.h>

int main(int argc, char **argv) {
int a, b, c; // some integers
int *pi;     // a pointer to an integer

a = 5;
pi = &a; // pi points to a
b = *pi; // b is now 5
pi = NULL; //7570750757005 -> address
// *537537057575 -> value in the address
// *NULL -> get me the value in address NULL, in xv6 -> address 0 [has the code?]
c = *pi; // this is a NULL pointer dereference
printf(c);
return 0;
}