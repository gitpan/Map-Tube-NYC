#!/usr/bin/perl

use strict; use warnings;
use Map::Tube::NYC;
use Test::More;

eval "use Test::CPAN::Meta::JSON";
plan skip_all => "Test::CPAN::Meta::JSON required for testing MYMETA.json" if $@;

my $meta    = meta_spec_ok('MYMETA.json', undef, @_);
my $version = $Map::Tube::NYC::VERSION;

is($meta->{version}, $version, 'MYMETA.json distribution version matches');

if($meta->{provides}) {
    for my $mod (keys %{$meta->{provides}}) {
        is($meta->{provides}{$mod}{version}, $version, "MYMETA.json entry [$mod] version matches");
    }
}

done_testing();
