/* ascii.c */

#include <stdio.h>

int main(int argc, char *argv[]) {
  FILE *fp;
  int c;
  while (--argc > 0) {
    fp = fopen(*++argv, "r");
    printf("%s:\n", *argv);
    while ((c = fgetc(fp)) != EOF) {
      printf("0x%02x ", c);
      if (c == '\n') {
        printf("\n");
      }
    }
    printf("\n");
  }
  return 0;
}
