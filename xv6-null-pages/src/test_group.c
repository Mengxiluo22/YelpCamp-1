#include "types.h"
#include "stat.h"
#include "user.h"
#define NULL ((void *)0)

int
main(int argc, char *argv[])
{
  //example taken from http://stackoverflow.com/questions/4007268/what-exactly-is-meant-by-de-referencing-a-null-pointer
  int *pi;
  pi = NULL;

  printf(1, "Null Pointer value: %p\n", *pi);
  exit();
}