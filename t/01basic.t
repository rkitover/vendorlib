use strict;
use warnings;

use Test::More tests => 1;

use lib 't/lib';
use vendorlib;

# check that we can load core XS and non-XS modules
use Data::Dumper;
use File::Basename;

eval "require Foo;";

ok $@, '@INC scrubbed';
