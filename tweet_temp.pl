use strict;
use Net::Twitter::Lite::WithAPIv1_1;
use Data::Dumper;
use DateTime
$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;

# --- --- dateTime --- --- #
my $dt = DateTime->now(time_zone=>'local');
print $dt."\n";

# --- --- tweet --- --- #
my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
  consumer_key        => 'mDQMiMN9DCx1NUN58EVY1Rn8y',
  consumer_secret     => 'gBds1272nouEEud3n2HS3ekg9FhSNwoBawKf7dEpEHAnVZfEqg',
  access_token        => '302578061-kwTNbycdbAJOaT66HPt9yJmLSIaqd0mPk4ja0nCS',
  access_token_secret => '7blXYY1hktigAaAwuDFRNTvJfpSTAUfEaL8RYvItTR94o',
  ssl                 => '1',
);

open FH, "< /sys/class/thermal/thermal_zone0/temp";
my $temp = <FH>;
close FH;

my $str = 'RasPi CPU Temp = '.($temp/1000)."\n";
print $str;

my $result = $nt->update($str);

#print Dumper $result;
print 'success!!';
