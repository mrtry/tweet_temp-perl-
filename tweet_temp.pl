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
  consumer_key        => 'your_app_key',
  consumer_secret     => 'your_app_secret',
  access_token        => 'your_access_token',
  access_token_secret => 'your_access_token_secret',
  ssl                 => '1',
);

open FH, "< /sys/class/thermal/thermal_zone0/temp";
my $temp = <FH>;
close FH;

my $str = 'RasPi CPU Temp = '.($temp/1000)."\n";
print $str;

my $result = $nt->update($str);

#print Dumper $result;
print 'success!!'."\n";
