#include "leak.h"

VALUE rb_mLeak;

VALUE
Leak_leak(VALUE self) {

    return Qnil;
}

void
Init_leak(void)
{
    rb_mLeak = rb_define_module("Leak");
    rb_define_module_function(rb_mLeak, "leak", Leak_leak, 0);
}
