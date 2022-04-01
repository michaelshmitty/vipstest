require 'ffi'

include FFI::Library

# These lines are cherry picked from libvips/ruby-vips:
# https://github.com/libvips/ruby-vips/blob/88e737c378c1e53e162b48527a94eebe0221e1dd/lib/vips.rb#L45

# With vips installed via Homebrew:
# ruby vipstest.rb
# should succeed and return no output

# If vips is installed via homebrew, uninstall it first.
# With vips installed via Nix as a buildInput in shell.nix:
# ruby vipstest.rb
# should throw an exception "Could not open library 'vips.42': dlopen(vips.42 ...) ..."
# Probable cause is dlopen() not looking in the Nix store for the vips dynamic library.
# Providing the full path of the vips library in the Nix store to the ffi_lib function below
# makes it work, e.g.:
# ffi_lib "/nix/store/jc7n25mrhssb2vb3v4wqpdgxxh48vkj8-vips-8.12.2/lib/libvips.42.dylib"


ffi_lib FFI::Library::LIBC
ffi_lib "glib-2.0.0"
ffi_lib "vips.42"
ffi_lib "gobject-2.0.0"
