package Colors;

# {{{ Use
use strict;
use warnings;
use Exporter::Lite;
# }}}

# Export {{{
our @EXPORT = qw(get_color_code);
# }}}

# sub get color code {{{
sub get_color_code {
	my ($lower_value, $upper_value, $ibex_dif) = @_;
	my ($i, $array_element, $color_code)  = ($upper_value, 0, "#FF0000");

	# Color codes, from: http://www.strangeplanet.fr/work/gradient-generator/index.php
	my @gradient = ("#00FF00","#0CF200","#19E500","#26D800","#33CC00","#3FBF00","#4CB200","#59A500","#669900","#728C00","#7F7F00","#8C7200","#996600","#A55900","#B24C00","#BF3F00","#CC3200","#D82600","#E51900","#F20C00","#FF0000");

	my $increment = ( $upper_value - $lower_value ) / scalar @gradient;

	while ($i >= $lower_value ) {
		if ( $ibex_dif >  $upper_value ) { $color_code = $gradient[0]; last }
		if ( $ibex_dif <= $lower_value ) { $color_code = $gradient[scalar @gradient -1]; last };

		if ( $ibex_dif >= ($i - $increment) and $ibex_dif < $i ) {
			$color_code = $gradient[$array_element];
			last;
		}
		$i = $i - $increment;
		$array_element++;
	}
	return $color_code;
}
# }}}

1;
