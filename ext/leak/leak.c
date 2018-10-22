#include "leak.h"

VALUE rb_mLeak;

void
Init_leak(void)
{
  rb_mLeak = rb_define_module("Leak");
}
