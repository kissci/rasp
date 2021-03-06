package HTMLfunc;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = qw(head foot);
@EXPORT_OK   = qw(head foot);
%EXPORT_TAGS = ( DEFAULT => [qw(&head &foot)],
                 Both    => [qw(&head &foot)]);

sub head {
	my $headstring = 'Content-type: text/html; charset=utf-8

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>'.$_[0].'</title>
	<meta name="robots" content="noindex, nofollow">
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<link rel="stylesheet" type="text/css" href="/inc/main.css" />
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Szatmárhegy WS</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Stat</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div><!--navbar end-->

	<div class="container">
';

	return $headstring;
}

sub foot {
	my $footstring = '
	</div><!--container end-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>
';
	return $footstring;
}

1;
