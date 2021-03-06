#!/usr/bin/perl

use strict;
use Getopt::Long;
use Time::HiRes qw( time usleep);

my $opt_bulk=1;
my $opt_wait=0.0006;
my $opt_unbuffered=1;
# Unbuffered output
$| = 1;


my $result = GetOptions(
"b|buld=i"  => \$opt_bulk,   # how often do we update in time
"s|sleep=f"    => \$opt_wait,   # how often do we update in lines
"u|unbuffered=i"   => \$opt_unbuffered);

my $wait = $opt_wait * 1000000;

open(my $fh, '<', $ARGV[0]) or die $!;

my $linecounter = 0;
my @lines;
my $time = time();
while (my $line = <$fh>) {
    print $line;
    usleep($wait);
}
