#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $WSdir = '/home/pi/WS/';

require $WSdir.'code/organizeData/organizeFunctions.pl';

my %data = makedata(time-60*60*24,time,60*60,$WSdir.'data/');
open (FILEOUT, '>'.$WSdir.'data/sum_last24h_3600.inc.pl') || die "Nem tudom megnyitni a filet: $!";
print FILEOUT Data::Dumper->Dump([\%data], ["\$data"]);
close (FILEOUT);
