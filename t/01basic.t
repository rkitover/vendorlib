use strict;
use warnings;

use Test::More tests => 1;

use lib 't/lib';
use vendorlib;

eval "require Foo;";

ok $@, '@INC scrubbed';
