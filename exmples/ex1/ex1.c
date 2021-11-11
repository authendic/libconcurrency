#include <stdio.h>
#include <coro.h>

coro cr;
coro cw;

void reader(cvalue r) {
  while (1) {
        printf("> ");
        r.c = getchar();
        if (r.c != '\n') {
                coro_call(cw, r);
        }
  }
}

void writer(cvalue w) {
  while(1) {
    printf(" echo: %c\n", w.c);
    printf(" echo: --------\n");
    w = coro_call(cr, cnone);
  }
}

int main(int argc, char **argv) {
  coro _main = coro_init();
  printf("Simple reader/writer echo...\n");
  cr = coro_new(reader);
  cw = coro_new(writer);
  coro_call(cw, cnone);
  return 0;
}
