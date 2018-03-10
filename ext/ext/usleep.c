#include <ruby.h>

#include <unistd.h>

static VALUE
do_sleep(VALUE mod, VALUE time_to_sleep)
{
  unsigned int naptime = NUM2UINT(time_to_sleep);

  sleep(naptime);

  return Qnil;
}

void
Init_ext()
{
  rb_require("usleep/version");

  VALUE mUsleep = rb_const_get(rb_cObject, rb_intern("Usleep"));

  rb_define_singleton_method(mUsleep, "sleep", do_sleep, 1);
}
