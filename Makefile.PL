use inc::Module::Install 0.91;

name     'vendorlib';
all_from 'lib/vendorlib.pm';
author   q{Rafael Kitover <rkitover@cpan.org>};
license  'perl';

build_requires 'Test::More';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/vendorlib.pm > README");
}

realclean_files 'README';

auto_provides;
auto_install;

WriteAll;
