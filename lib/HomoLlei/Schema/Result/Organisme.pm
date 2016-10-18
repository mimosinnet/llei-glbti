use utf8;
package HomoLlei::Schema::Result::Organisme;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HomoLlei::Schema::Result::Organisme

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Organismes>

=cut

__PACKAGE__->table("Organismes");

=head1 ACCESSORS

=head2 codi_o

  data_type: 'text'
  is_nullable: 0

=head2 organisme

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "codi_o",
  { data_type => "text", is_nullable => 0 },
  "organisme",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</codi_o>

=back

=cut

__PACKAGE__->set_primary_key("codi_o");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-10-16 10:55:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ScRh2O0TVbkFGzbbK7cwww


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
