/* ascii.c */

#include <stdio.h>

int main(int argc, char *argv[]) {
  FILE *fp;
  int c, lnum;
  char lnum_needed = 1;
  while (--argc > 0) {
    lnum = 0;
    fp = fopen(*++argv, "r");
    printf("%s:\n", *argv);
    while ((c = fgetc(fp)) != EOF) {
      if (lnum_needed) {
        printf("%3d: ", lnum++);
        lnum_needed = 0;
      }
      printf("0x%02x ", c);
      if (c == '\n') {
        printf("\n");
        lnum_needed = 1;
      }
    }
    printf("\n");
  }
  return 0;
}
