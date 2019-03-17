#include <stdlib.h>
#include <malloc.h>
#include <stdio.h>

int main()
{
  unsigned int count, count2;
  const unsigned int maxcount = 100000;
  void *arr[maxcount], *arr2[maxcount];
  void *ptr;
  const unsigned int pieces = 10000;
  const unsigned int pieces2 = 100;
  const unsigned int piecesize = sizeof(void*);

  for (count = 0; count < maxcount; count++)
  {
	  ptr = calloc(pieces, piecesize);

	  if (ptr)
	  {
		  arr[count] = ptr;
	  }
	  else
	  {
		  break;
	  }
  }
  
  for (count2 = 0; count2 < maxcount; count2++)
  {
	  ptr = calloc(pieces2, piecesize);

	  if (ptr)
	  {
		  arr2[count2] = ptr;
	  }
	  else
	  {
		  break;
	  }
  }

	printf("You are free now!\n");

  return 0;
}
