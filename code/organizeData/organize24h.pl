#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

require 'organizeFunctions.pl';


#makedata(time-60*60*24*30,time,60*60*24);
my %data = makedata(time-60*60*24,time,60*60);
print Data::Dumper->Dump([\%data], ["\$data"]);



#zipping file
#	system("cd ".$datadir." && tar -zcvf ".$filename.".tar.gz ".$filename);
#del original file
#	system("cd ".$datadir." && sudo rm -f ".$filename);
