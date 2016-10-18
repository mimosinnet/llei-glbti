use warnings;
use strict;

use FindBin qw($Bin);
use lib "$Bin/lib";

use HomoLlei::Schema;
use HomoLlei::Model::Llei;

my $schema = HomoLlei::Schema->connect('dbi:SQLite:dbname=data/llei.db', '', '', 
		{sqlite_unicode => 1 } 
	) || die "Cannot connect";

my $llei_rs = $schema->resultset('TextLlei');
while( my $codi = $llei_rs->next) {
  print $codi->codi . " " ;
}

# vim: tabstop=2
