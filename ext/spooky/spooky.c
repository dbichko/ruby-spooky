#include "spooky.h"

VALUE rb_SpookyHashV2;

VALUE rb_spooky_version() {
  return rb_str_new2(SC_VERSION);
}

void Init_spooky() {
  rb_SpookyHashV2 = rb_define_module("SpookyHashV2");
  rb_define_singleton_method(rb_SpookyHashV2, "spooky_version", rb_spooky_version, 0);
}
