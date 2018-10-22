#include "leak.h"

#include <stdlib.h>

VALUE rb_mLeak;
void *ptr = NULL;

static void
allocate_memory() {
    // borrowed from https://www.rubyguides.com/2018/04/ruby-memory-leak/
    for(int i = 0; i < 10000; i++) {
        ptr = malloc(1000);
    }
}

VALUE
Leak_leak(VALUE self) {
    // Leak some memory
    allocate_memory();
    return Qnil;
}

void
Init_leak(void)
{
    ptr = NULL;
    rb_mLeak = rb_define_module("Leak");
    rb_define_module_function(rb_mLeak, "leak", Leak_leak, 0);
}
