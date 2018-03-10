Usleep
======

This Ruby gem provides a module with a single function: `Usleep.sleep( )`

This function sleeps for an integer amount of seconds in C code while holding
the Ruby Global VM Lock (GVL). This is a worthless behavior that noone should
allow in production code, but is useful in testing for simulating an operation
that blocks other Ruby threads and is "uninterpretable" from other Ruby code
once it begins.
