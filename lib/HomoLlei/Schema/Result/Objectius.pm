use utf8;
package HomoLlei::Schema::Result::Objectius;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

HomoLlei::Schema::Result::Objectius

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Objectius>

=cut

__PACKAGE__->table("Objectius");

=head1 ACCESSORS

=head2 num

  data_type: 'char'
  is_nullable: 0
  size: 15

=head2 codi

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 3

=head2 nivell

  data_type: 'integer'
  is_nullable: 1

=head2 num_obj

  data_type: 'integer'
  is_nullable: 1

=head2 objectiu

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "num",
  { data_type => "char", is_nullable => 0, size => 15 },
  "codi",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 3 },
  "nivell",
  { data_type => "integer", is_nullable => 1 },
  "num_obj",
  { data_type => "integer", is_nullable => 1 },
  "objectiu",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</num>

=back

=cut

__PACKAGE__->set_primary_key("num");

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


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-10-12 00:58:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ayk2Os7swMnRkiiXoq3T1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
