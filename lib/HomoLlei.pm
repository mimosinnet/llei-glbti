package HomoLlei;
use Mojo::Base 'Mojolicious';

use HomoLlei::Schema;
use HomoLlei::Model::Llei;

has schema => sub {
	return HomoLlei::Schema->connect('dbi:SQLite:dbname=data/llei.db', '', '', 
		{sqlite_unicode => 1 } 
	) || die "Cannot connect";
};

# This method will run once at server start
sub startup {
  my $self = shift;

	$self->plugin('Config', file => 'homollei.conf');
	$self->secrets('NovaParaulaClau per les cookies 12342142142351526903214');

 	$self->helper(db => sub { $self->app->schema });
	$self->helper(
     m_llei => sub { state $m_llei = HomoLlei::Model::Llei->new(db => shift->db) });

	# Convertir 100.100.100 en 1.1.1 {{{
	$self->helper( print_num => sub {
			my $self = shift;
			my $num_itm = shift;
			my @num			= split('\.',$num_itm);
			@num				= map { $_ - 100 } @num;
			my $num			= join('.', @num);
			return $num;
		});
	# }}}
	
	# Color a partir d'un número {{{
	$self->helper( print_color => sub {
			my $self = shift;
			my $punts = shift;
			return "#66CCFF" if $punts eq "9";
			my ($i, $array_element, $color_code)  = (0, 0, "FF0000");
			my @gradient = qw(993333 A7502B B66D24 C48A1D D3A715 E1C40E F0E107 FFFF00 DAE100 B6C400 91A700 6D8A00 486D00 245000 003300);
			# my @gradient = ("FF0000","FF3300","FF6600","FF9900","FFCC00","FFFF00","BFFF00","7FFF00","3FFF00","00FF00");
			my $increment = 1 / scalar @gradient;
			while ( $i <= 1 ) {
				if ( $punts <=  0 ) { $color_code = $gradient[0]; last }
				if ( $punts >= 	1 ) { $color_code = $gradient[scalar @gradient -1]; last };

				if ( $punts >= $i and ($punts < $i + $increment) ) {
					$color_code = $gradient[$array_element];
					last;
				}
				$i = $i + $increment;
				$array_element++;
			}
			return "#$color_code";
		});
	# }}}

  # Router
  my $r = $self->routes;

  # Normal route to controller
	$r->get('/')->to('llei#inici');
	$r->get('/llei/:article')->to('llei#llei');
	$r->get('/objectius')->to('llei#objectius');
	$r->get('/agents')->to('llei#agents');
	$r->get('/obj/:nivell/:subn')->to('llei#obj');
	$r->get('/accions/:objectiu')->to('llei#accions');

}

1;

# vim: tabstop=2
