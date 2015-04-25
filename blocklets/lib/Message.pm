package Message;

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use Exporter::Lite;
# }}}

# Export {{{
our @EXPORT = qw($message $ibex_dif);
our $message 	= "Error";
our $ibex_dif	= "";
# }}}

# {{{ Var

my $ua = LWP::UserAgent->new;
$ua->timeout(10);
my $url 		= 'http://www.ibex35.com/esp/aspx/Mercados/Precios.aspx?indice=ESI100000000&punto=indice';
my $response 	= $ua->get($url);
# }}}

# {{{ Response 
if ($response->is_success) {
	my $page = $response->decoded_content;
	# say $page; exit;
	my $tb = '</td><td>';
	my $number  = qr/\d+\.\d+,\d+/;
	my $percent = qr/-?\d+,\d+/;
	my $date = qr?\d{2}/\d{2}/\d{4}?;
	my $hour = qr/\d{2}:\d{2}/;
	# my ($test) = ( $page =~ /(<td class=.*IBEX 35&#174;.*)/);
	# say $test;
	my ($ultimo, $dif, $maximo, $minimo, $hora) = 
	($page =~ m?<td class=.*IBEX 35&#174;${tb}${number}${tb}($number).*">($percent)${tb}($number)${tb}($number).*($hour)?);

	$message = "$ultimo $dif% $hora";
	my ($int, $dec)	= ($dif =~ /(.*),(\d+)/);
	$ibex_dif = "$int.$dec";
}
# }}}

1;

