use utf8;
package HomoLlei::Schema::Result::Realitzacio;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HomoLlei::Schema::Result::Realitzacio

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Realitzacio>

=cut

__PACKAGE__->table("Realitzacio");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 codi

  data_type: 'text'
  is_foreign_key: 1
  is_nullable: 0

=head2 num_obj

  data_type: 'integer'
  is_nullable: 1

=head2 accio

  data_type: 'text'
  is_nullable: 1

=head2 agent

  data_type: 'text'
  is_nullable: 1

=head2 fet

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "codi",
  { data_type => "text", is_foreign_key => 1, is_nullable => 0 },
  "num_obj",
  { data_type => "integer", is_nullable => 1 },
  "accio",
  { data_type => "text", is_nullable => 1 },
  "agent",
  { data_type => "text", is_nullable => 1 },
  "fet",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 codi

Type: belongs_to

Related object: L<HomoLlei::Schema::Result::TextLlei>

=cut

__PACKAGE__->belongs_to(
  "codi",
  "HomoLlei::Schema::Result::TextLlei",
  { codi => "codi" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-10-12 11:35:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bsHCds9d3DbRA6pg7g3BgQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
