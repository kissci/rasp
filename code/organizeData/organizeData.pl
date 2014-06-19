#!/usr/bin/perl
use strict;
use warnings;

(my $sec,my $min,my $hour,my $mday,my $mon,my $year,my $wday,my $yday,my $isdst) = localtime(time);
$year+=1900; $mon+=1;
if ($mday < 10) {$mday='0'.$mday;}
if ($mon < 10) {$mon='0'.$mon;}
#(my $prevsec,my $prevmin,my $prevhour,my $prevmday,my $prevmon,my $prevyear,my $prevwday,my $prevyday,my $previsdst) = localtime(time-60*60*24);
#$prevyear+=1900; $prevmon+=1;
#if ($prevmday < 10) {$prevmday='0'.$prevmday;}
#if ($prevmon < 10) {$prevmon='0'.$prevmon;}

my $datadir = "/root/WS/data/".$year."/".$mon;

opendir(my $dh, $datadir) || die;
while(readdir $dh) {
	# ha ponttal keződik vagy gzippelt vagy a mai fájl akkor nem piszkáljuk
	if ($_ =~ m/(^\.|\.gz$|$mon$mday\.csv$)/) {next;}
	# ha már be van zippelve hagyjuk békén
	if (-e $datadir."/".$_.".tar.gz") {next;}

	#calculate average

	#zipping file
	system("cd ".$datadir." && tar -zcvf ".$_.".tar.gz ".$_);
}
closedir $dh;

