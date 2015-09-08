package Get_String;

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use Exporter::Lite;
# }}}

# Export {{{
our @EXPORT = qw(get_string);
# }}}

# sub get_index {{{
sub get_string {
	my ($url) = shift;
	my $ua = LWP::UserAgent->new;
	$ua->timeout(10);
	my $response 	= $ua->get($url);
	if ($response->is_success) {
		my $page = $response->decoded_content;
		# say $page; exit;
		my $number  = qr/[+-]?\d+,\d+/;
		my $ano		= "A" . pack("U",0x00F1). "o"; # Año
		my $anos	= "a" . pack("U",0x00F1). "os"; # 3 años
		my ($dif)	= ( $page =~ /Cambio.*>($number)%/ 	);
		my ($acum)	= ( $page =~ /$ano.*>($number).*3.$anos/ );

		my $message = "$dif% $acum%";
		my ($int, $dec)	= ($dif =~ /(.*),(\d+)/);
		my $variacion = "$int.$dec";
		return ($message,$variacion);
	}
}

# }}}

1;
