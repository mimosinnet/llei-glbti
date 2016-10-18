use utf8;
package HomoLlei::Schema::Result::TextLlei;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HomoLlei::Schema::Result::TextLlei

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<TextLlei>

=cut

__PACKAGE__->table("TextLlei");

=head1 ACCESSORS

=head2 codi

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 text

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "codi",
  { data_type => "char", is_nullable => 0, size => 3 },
  "text",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</codi>

=back

=cut

__PACKAGE__->set_primary_key("codi");

=head1 RELATIONS

=head2 objectiuses

Type: has_many

Related object: L<HomoLlei::Schema::Result::Objectius>

=cut

__PACKAGE__->has_many(
  "objectiuses",
  "HomoLlei::Schema::Result::Objectius",
  { "foreign.codi" => "self.codi" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 realitzacios

Type: has_many

Related object: L<HomoLlei::Schema::Result::Realitzacio>

=cut

__PACKAGE__->has_many(
  "realitzacios",
  "HomoLlei::Schema::Result::Realitzacio",
  { "foreign.codi" => "self.codi" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-10-11 23:01:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8EztUkRCrWiCiA2iWBw3xw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
