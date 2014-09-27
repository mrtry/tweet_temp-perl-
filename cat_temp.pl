#!/usr/bin/perl
use utf8;

open FH, "< /sys/class/thermal/thermal_zone0/temp";
my $temp = <FH>;
close FH;

$str = 'RasPi CPU Temp = '.($temp/1000)."\n";

print $str;
