#include <ruby.h>

#ifdef HAVE_RUBY_WIN32_H
#include <windows.h>
#else
#include <unistd.h>
#endif

static VALUE
do_sleep(VALUE mod, VALUE time_to_sleep)
{
  unsigned int naptime = NUM2UINT(time_to_sleep);

#ifdef HAVE_RUBY_WIN32_H
  // Win32 sleeps by millisecond.
  Sleep(naptime * 1000);
#else
  sleep(naptime);
#endif

  return Qnil;
}

void
Init_ext()
{
  rb_require("usleep/version");

  VALUE mUsleep = rb_const_get(rb_cObject, rb_intern("Usleep"));

  rb_define_singleton_method(mUsleep, "sleep", do_sleep, 1);
}
