/* ascii.c */

#include <stdio.h>
#include <stdlib.h>
#define LNON 01
#define STARTLINE 02

int main(int argc, char *argv[]) {
  char *DEC = "%02d ", *OCT = "0%02o ", *HEX = "0x%02x ";
  char linenum = STARTLINE, *prog_name = argv[0];
  char *format = DEC;
  FILE *fp;
  int c, lnum;
  while (--argc > 0 && (*++argv)[0] == '-') {
    while (c = *++(argv[0])) {
      switch (c) {
        case 'l':
          linenum |= LNON;
          break;
        case 'd':
          format = DEC;
          break;
        case 'o':
          format = OCT;
          break;
        case 'x':
          format = HEX;
          break;
        default:
          fprintf(stderr, "%s: illegal option %c\n", prog_name, c);
          exit(1);
      }
    }
  }
  while (argc-- > 0) {
    lnum = 0;
    fp = fopen(*argv, "r");
    printf("%s:\n", *argv++);
    while ((c = fgetc(fp)) != EOF) {
      if ((linenum & STARTLINE) && (linenum & LNON)) {
        printf("%3d: ", lnum++);
        linenum &= ~STARTLINE;
      }
      printf(format, c);
      if (c == '\n') {
        printf("\n");
        linenum |= STARTLINE;
      }
    }
    printf("\n");
  }
  return 0;
}
