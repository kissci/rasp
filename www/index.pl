#!/usr/bin/perl
use strict;
use lib './inc';
use HTMLfunc;
use Data::Dumper;

for (my $i = time-60*60*24*30; $i <= time; $i+=86400) {
	my @d = localtime($i);
	$d[4]++;if ($d[4] < 10){$d[4]='0'.$d[4]};
		if ($d[3] < 10){$d[3]='0'.$d[3]};
	my $datestring = ($d[5]+1900).($d[4]).($d[3]);
	print $datestring."\n";
}

exit;


print '		<div class="row" style="padding-top: 1em">
			<div class="col-xs-4 col-centered">2014. 06. 14.</div>
			<div class="col-xs-4 col-centered">k: 04:45</div>
			<div class="col-xs-4 col-centered">ny: 20:44</div>
		</div>
		<h2>Legfrissebb mért értékek</h2>
		<div class="row" style="background-color: #e2e2e2; padding: 0.5em 0 1em 0; margin-bottom: 1em;">
			<div class="col-xs-4 col-centered">
				<h4>kint</h4>21:15 | 32.3%
			</div>
			<div class="col-xs-4 col-centered">
				<span class="value">18.4°C</span><br />
				<div class="avg"><span class="text-primary">16.9</span> <span class="text-danger">23.9</span> 19.9</div>
			</div>
			<div class="col-xs-4 col-centered"><h4>XXXX Hpa</h4></div>
		</div>
		<div class="row">
			<div class="col-xs-4 col-centered">
				<h4>bent</h4>
				21:10 | 40.8 %
			</div>
			<div class="col-xs-4 col-centered">
				<span class="value">25.1°C</span><br />
				<div class="avg"><span class="text-primary">24.7</span> <span class="text-danger">26.5</span> 25.4</div>
			</div>
			<div class="col-xs-4 value hum">
				XXX
			</div>
		</div>
		<hr/>



<div class="alert alert-danger">

    <strong>

        Oh snap!

    </strong>

     Change a few things up and try submitting again.
    …

</div>
';

print "<p>";
open(FILE, '<./data/bmp180.act.csv');
while (<FILE>) {
	if (/^([^;]+);([^;]+);([^;]+)$/) {
print '
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["gauge"]});
      google.setOnLoadCallback(drawChartTemp);
      google.setOnLoadCallback(drawChartHpa);

      function drawChartTemp() {
        var data = google.visualization.arrayToDataTable([
          ["Label", "Value"],
          ["Kint", '.$2.'],
        ]);
        var options = {
		width: 150, height: 150,
		/*blue*/	redFrom: -20, redTo: -10, redColor: "#ADDFFF",
		/*yellow*/	yellowFrom: 30, yellowTo: 40, yellowColor: "#FF9900",
		minorTicks: 5,
		majorTicks: ["-20","","-10","","0","","10","","20","","30","","40"],
		max: 40,
		min: -20
	};

        var chart = new google.visualization.Gauge(document.getElementById("chart_divtemp"));
        chart.draw(data, options);
      }
      function drawChartHpa() {
        var data = google.visualization.arrayToDataTable([
          ["Label", "Value"],
          ["HPa", '.$3.'],
        ]);
        var options = {
		width: 150, height: 150,
		/*blue*/	redFrom: -30, redTo: -10, redColor: "#ADDFFF",
		/*yellow*/	yellowFrom: 30, yellowTo: 50, yellowColor: "#FF9900",
		minorTicks: 10,
		majorTicks: ["980","990","1000","1010","1020","1030","1040"],
		max: 1040,
		min: 980
	};

        var chart = new google.visualization.Gauge(document.getElementById("chart_divhpa"));
        chart.draw(data, options);
      }

    </script>';

		print '<div class="grafgauge" id="chart_divtemp"></div>';
		print '<div class="grafgauge" id="chart_divhpa"></div>';

		print "".$1."<br/>";
	}

}
close(FILE);

print "";


print foot();