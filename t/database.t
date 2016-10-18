#!/usr/bin/perl -w

use FindBin qw($Bin);
use lib "$Bin/../lib";

use strict;
use warnings;

use Test::More tests => 5;
use Test::DBIx::Class {
		schema_class => 'HomoLlei::Schema',
		connect_info => ['dbi:SQLite:dbname=data/data.db', '', ''],
		connect_opts => {sqlite_unicode => 1 }
};

use_ok('HomoLlei::Schema');
use_ok('HomoLlei::Schema::Result::TextLlei');

ok ResultSet('TextLlei'), "Camp codis";
ok ResultSet('TextLlei')->search({ codis => {'eq' =>  'A00' } }),  
	"Ha trobat A00";
ok ResultSet('TextLlei')->search({ codis => {'eq' =>  'xxx' } }),  
	"Ha trobat A00";

ok my $codis = TextLlei->find('codis');
# is_fields 'codi', $codi, ['A00'], 'Ha trobat A00';

# ok my $john = TextLlei->find({codi=>'A00'});

# use HomoLlei::Schema;

# my $db = HomoLlei::Schema->connect('dbi:SQLite:dbname=data/data.db', '', '', 
#		{sqlite_unicode => 1 } 
#	);

# ok($model->connect(), "connect"); #works

#my $model = $db->resultset('TextLlei');


#my $model = HomoLlei::Text_Llei->new();

#cmp_ok($model->{ModelName}, 'eq', 'User', 'model name');



#ok($model->{schema}->resultset('User'));

done_testing;

# vim: tabstop=2
