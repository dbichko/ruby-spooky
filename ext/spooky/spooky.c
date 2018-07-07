#include "ruby.h"
#include "spooky_hash.h"

const uint64_t SP_SEED = 0ul;

VALUE rb_SpookyHashV2;

VALUE rb_spooky_version() {
  return rb_str_new2(SC_VERSION);
}

VALUE rb_hash128(VALUE self, VALUE str) {
  Check_Type(str, T_STRING);

  size_t len = RSTRING_LEN(str);
  uint64_t hash1 = SP_SEED;
  uint64_t hash2 = SP_SEED;

  spooky_hash128(RSTRING_PTR(str), len, &hash1, &hash2);
  return rb_sprintf("%016lx%016lx", hash2, hash1);
}

VALUE rb_hash64(VALUE self, VALUE str) {
  Check_Type(str, T_STRING);
  return rb_sprintf("%016lx", spooky_hash64(RSTRING_PTR(str), RSTRING_LEN(str), SP_SEED));
}

VALUE rb_hash32(VALUE self, VALUE str) {
  Check_Type(str, T_STRING);
  return rb_sprintf("%08x", spooky_hash32(RSTRING_PTR(str), RSTRING_LEN(str), SP_SEED));
}

void Init_spooky() {
  rb_SpookyHashV2 = rb_define_module("SpookyHashV2");
  rb_define_singleton_method(rb_SpookyHashV2, "spooky_version", rb_spooky_version, 0);
  rb_define_singleton_method(rb_SpookyHashV2, "hash128", rb_hash128, 1);
  rb_define_singleton_method(rb_SpookyHashV2, "hash64", rb_hash64, 1);
  rb_define_singleton_method(rb_SpookyHashV2, "hash32", rb_hash32, 1);
}
