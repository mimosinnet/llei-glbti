package HomoLlei::Model::Llei;
use Mojo::Base -base;

has 'db';

sub llei {
	my ($self) = @_;
	return $self->db->resultset('TextLlei');
}

sub codis {
	my ($self) = @_;
	return sort $self->db->resultset('TextLlei')->get_column('codi')->all;
}

sub text {  # text de la llei
	my ($self, $article) = @_;
	return $self->db->resultset('TextLlei')->find({ codi => $article });
}

sub objectiu { #trobar un objectiu a partir del codi
	my ($self, $codi) = @_;
	return $self->db->resultset('Objectius')->find({ num => $codi });
}

sub objectius_llei { # objectius associats al text llei
	my ($self, $article) = @_;
	return $self->db->resultset('Objectius')->search_rs({ codi => $article });
}

sub nivell_obj { # Objectius d'un nivell
	my ($self, $nivell) = @_;
	return $self->db->resultset('Objectius')->search_rs({ nivell => $nivell });
}

sub objectius { # Objectius 
	my ($self) = @_;
	return $self->db->resultset('Objectius');
}

sub punts { # Puntuació obtinguda en el objectiu {{{
	my ($self, $codi_objectiu) = @_;
	# nivell corresponent a l'objectiu
	# A la taula "Objectius", el num correspont al codi objectiu, i.e.:  101.101.102
	my $objectiu = $self->db->resultset('Objectius')->find({ num => $codi_objectiu });
	my $nivell = $objectiu->nivell;
	# Restem 100 als 3 primers dígits de codi_objectiu -> número objectiu
	my $num_obj = (substr $codi_objectiu, 0, 3) - 100;
	my @items;
	if ( $nivell eq 1) {
		# Si estem al nivell 1 (i.e., 101 ), agafem tots els de l'obectiu
		@items = $self->db->resultset('Realitzacio')->search_rs({ num_obj => $num_obj })->get_column('fet')->all;
		} else {
		# Si no, agafem totes les tasques de codi d'objectiu
		@items = $self->db->resultset('Realitzacio')->search_rs({ codi => $codi_objectiu })->get_column('fet')->all;
		}
	# my @items = $self->db->resultset('Realitzacio')->search_rs({ codi => $codi_objectiu })->get_column('fet')->all;
	return "9" if @items == 0;
	return eval( join("+", @items)) / @items;
} # }}}

sub accions { # accions per cada objectiu
	my ($self, $objectiu_num) = @_;
	return $self->db->resultset('Realitzacio')->search_rs({ num_obj => $objectiu_num });
}

sub agent { # diu l'agent a partir del codi d'agent
	my ($self, $codi) = @_;
	my $registre = $self->db->resultset('Organisme')->find({ codi_o => $codi });
	return $registre->organisme if defined $registre;
	return "No Definit";
}

sub agents { # llista dels agents implementadors
	my ($self) = @_;
	return $self->db->resultset('Organisme');
}

1;
# vim: tabstop=2
