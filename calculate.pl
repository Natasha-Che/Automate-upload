#!/usr/bin/perl                                                                                                                                                      
open(FILE1,"dates");
$line3=<FILE1>;
chomp $line3;
print "Distribution of the day"." ".$line3."\n";

$head="Browser Type\t"."Browser Version\t"."OS Type\t"."OS Version\t"."Number of Requests\t"."%/ Total Requests\t"."Cumulative %/Total Requests\t"."Number of Impres\
sions\t"."%/ Total Impressions\t"."Cumulative %/Total Impressions\t". "Number of Revenue\t"."%/ Total Revenue\t"."Cumulative %/Total Revenue\t"."\n";

print $head;

$total_req=0;
open(FILE,"tq_browser_os_distribution1");
while (<FILE>) {
    $line=$_;
    chomp $line;
    (@a) = split /\t/, $line;
    $total_req=$total_req+$a[4];
    $total_imp=$total_imp+$a[5];
    $total_rev=$total_rev+$a[6];
}

close(FILE);

$per_req=0;
$per_imp=0;
$per_rev=0;
$cul_per_req=0;
$cul_per_imp=0;
$cul_per_rev=0;
$cul_req=0;
$cul_imp=0;
$cul_rev=0;
$req_count=0;
$imp_count=0;
$rev_count=0;
open(FILE1,"tq_browser_os_distribution1");
while (<FILE1>)
{ $line=$_;
