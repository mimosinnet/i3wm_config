package Bolsa_Economista;

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use Exporter::Lite;
# }}}

# Export {{{
our @EXPORT = qw(get_index);
# }}}

# sub get_index {{{
sub get_index {
	my ($url) = shift;
	my $ua = LWP::UserAgent->new;
	$ua->timeout(10);
	my $response 	= $ua->get($url);
	if ($response->is_success) {
		my $page = $response->decoded_content;
		# say $page; exit;
		my $number  = qr/[+-]?\d+,\d+/;
		my $hour 	= qr/\d{2}:\d{2}/;
		my ($ultimo) = ( $page =~ /precio_ultima_cotizacion.*>($number)/ 	);
		my ($dif)	 = ( $page =~ /variacion_porcentual.*>($number)%/ 		);
		my ($hora)	 = ( $page =~ /hora_ultima_cotizacion.*>($hour):\d{2}/ 	);

		my $message = "$ultimo $dif% $hora";
		my ($int, $dec)	= ($dif =~ /(.*),(\d+)/);
		my $variacion = "$int.$dec";
		return ($message,$variacion);
	}
}

# }}}
1;
