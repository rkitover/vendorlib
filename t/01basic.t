use strict;
use warnings;

use Test::More tests => 3;

use lib 't/lib';
use vendorlib;

# check that we can load core XS and non-XS modules
use Data::Dumper;
use File::Basename;
use Config;

eval "require Foo;";

ok $@, '@INC scrubbed';

# test bare tilde expansion
{
    local @INC;

    my %config = %Config;

    *vendorlib::Config = \%config;

    local $config{vendorarch} = '~//foo';

    vendorlib->import;

    my $expanded = (getpwuid($<))[7] . '/foo';

    is $INC[1], $expanded, 'bare tilde expansion';
}

# test tilde expansion with user name
{
    local @INC;

    my %config = %Config;

    *vendorlib::Config = \%config;

    my $whoami = (getpwuid($<))[0];

    local $config{vendorarch} = "~${whoami}//foo";

    vendorlib->import;

    my $expanded = (getpwuid($<))[7] . '/foo';

    is $INC[1], $expanded, 'tilde expansion with user name';
}
