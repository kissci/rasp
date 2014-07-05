#!/usr/bin/perl
use strict;
use warnings;

sub makedata () {
	if ( $#_ < 2) {
		print "ERR\n";
		return -1;
	}
	my $startdate = $_[0];
	my $enddate = $_[1];
	my $interval = $_[2];
	my $datadir = "/home/pi/WS/data/";
	my %data;
	#read files 
	for (my $i = $startdate; $i <= $enddate; $i += (60*60*24)) {
		my @d = localtime($i);
		$d[4]++;if ($d[4] < 10){$d[4]='0'.$d[4]};
			if ($d[3] < 10){$d[3]='0'.$d[3]};
		$d[5]+=1900;
		my @sensors = ('bmp180');
		foreach my $sens (@sensors) {
			my $file = $datadir.$d[5]."/".$d[4]."/".$sens.".".$d[5].$d[4].$d[3].".csv";
			if (-e $file) {
				open (FILEIN, "<".$file) || die "";
				while (<FILEIN>) {
					if (/^([^;]+);([^;]+);(.*)$/) {
						if ($1 >= $startdate && $1 <= $enddate) {
							if ($sens eq 'bmp180') {
								my $startinterval = $startdate+(int(($1-$startdate)/$interval))*$interval;
								if (ref($data{$startinterval}->{$sens}->{'temp' }->{'data'}) ne 'ARRAY') {
									$data{$startinterval}->{$sens}->{'temp' }->{'data'} = [];
								}
								if (ref($data{$startinterval}->{$sens}->{'press'}->{'data'}) ne 'ARRAY') {
									$data{$startinterval}->{$sens}->{'press'}->{'data'} = [];
								}
								push($data{$startinterval}->{$sens}->{'temp' }->{'data'}, $2);
								push($data{$startinterval}->{$sens}->{'press'}->{'data'}, $3);
							}
						}
					}
				}
				close (FILEIN);
			}
		}
	}

	foreach my $timestamp (keys %data) {
		foreach my $sensor (keys $data{$timestamp}) {
			if ($sensor eq 'bmp180') {
				$data{$timestamp}->{$sensor}->{'temp'} = calc($data{$timestamp}->{$sensor}->{'temp'}->{'data'});
				$data{$timestamp}->{$sensor}->{'press'} = calc($data{$timestamp}->{$sensor}->{'press'}->{'data'});
			}
		}
	}

	return %data;

}

sub calc () {
	my (@data) = @{$_[0]};
	@data = sort @data;
	if ($#data > 100) {
		splice(@data, 0, 5);
		splice(@data, -5);
	} elsif ($#data > 10) {
		splice(@data, 0, 1);
		splice(@data, -1);
	}
	return {
		'min'=>$data[0],
		'max'=> $data[-1],
		'avg'=>average(@data)
	}
}

sub average {
    my @array = @_; # save the array passed to this function
    my $sum; # create a variable to hold the sum of the array's values
    foreach (@array) { $sum += $_; } # add each element of the array 
    # to the sum
    return $sum/@array;	# divide sum by the number of elements in the
			# array to find the mean
}

1;