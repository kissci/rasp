#!/usr/bin/perl
use strict;
my $dataout = '';
for (my $i = time-60*60*24*30; $i < time; $i+=86400) {
	my @d = localtime($i);
	$d[4]++;if ($d[4] < 10){$d[4]='0'.$d[4]};
		if ($d[3] < 10){$d[3]='0'.$d[3]};
	$d[5]+=1900;
	my @sensors = ('bmp180');
	foreach my $sens (@sensors) {
		my $file = "/home/pi/WS/data/".$d[5]."/".$d[4]."/".$sens.".".$d[5].$d[4].$d[3].".min.inc";
		if (-e $file) {
			open (FILEIN, "<".$file) || die "";
			while (<FILEIN>){
				$dataout .= $_;
			}
			close (FILEIN);
			
		}
	}
}
open (FILEOUT, ">/home/pi/WS/data/last30days/data.inc" ) || die "";
print FILEOUT $dataout;
close (FILEOUT);
