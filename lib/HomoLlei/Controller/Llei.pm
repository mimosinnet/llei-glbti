package HomoLlei::Controller::Llei;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub inici {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Avaluacó de la Implementació de la Llei 11/2014, del 10 d\'octubre, per a garantir els drets de lesbianes, gais, bisexuals, transgèneres i
intersexuals i per a eradicar l\'homofòbia, la bifòbia i la transfòbia.');
}

sub llei {
  my $self = shift;
	my $article = $self->stash('article');
	$self->render ( 
		article   => $article,
	);
}

sub objectius {
  my $self = shift;
	$self->render;
}

sub agents {
  my $self = shift;
	$self->render;
}

sub obj {
  my $self = shift;
	my $nivell = $self->stash('nivell');
	my $subn	 = $self->stash('subn');
	$self->render (
		nivell => $nivell,
		subn	 => $subn
	);
}

sub accions {
  my $self = shift;
	my $objectiu = $self->stash('objectiu');
	# Transforma 100100120 en 100.100.120 {{{
	my @objectiu = split(//,$objectiu);
	my $codi_objectiu;
	foreach (@objectiu) {
		$codi_objectiu .= shift @objectiu;
		$codi_objectiu .= shift @objectiu;
		$codi_objectiu .= shift @objectiu;
		$codi_objectiu .= ".";
	}
	chop $codi_objectiu;
	# }}}
	$self->render (
		nivell => 2,
		subn	 => 101,
		objectiu => $codi_objectiu
	);
}


1;

# vim:  tabstop=2
