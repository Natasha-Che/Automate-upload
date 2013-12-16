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
chomp $line;
  (@a)=split /\t/, $line;
  $per_req=$a[4]/$total_req;
  $per_imp=$a[5]/$total_imp;
  $per_rev=$a[6]/$total_rev;
  $cul_req=$cul_req+$a[4];
  $cul_imp=$cul_imp+$a[5];
  $cul_rev=$cul_rev+$a[6];
  $cul_per_req=$cul_req/$total_req;
  $cul_per_imp=$cul_imp/$total_imp;
  $cul_per_rev=$cul_rev/$total_rev;
  $req_count=$a[4];
  for ($i = -3; $i > -1 * length($req_count); $i -= 4)
  {substr($req_count, $i,0)=',';
}
  $imp_count=$a[5];
  for ($i = -3; $i > -1 * length($imp_count); $i -= 4)
  {substr($imp_count, $i,0)=',';
}

  $rev_count=int($a[6]);
   for ($i = -3; $i > -1 * length($rev_count); $i -= 4)
  {substr($rev_count, $i,0)=',';
}
  $per_req1=int($per_req*10000000)/100000;
  $per_imp1=int($per_imp*10000000)/100000;
  $per_rev1=int($per_rev*10000000)/100000;
  $cul_per_req1=int($cul_per_req*10000000)/100000;
  $cul_per_imp1=int($cul_per_imp*10000000)/100000;
  $cul_per_rev1=int($cul_per_rev*10000000)/100000;
  print $a[0]."\t".$a[1]."\t".$a[2]."\t".$a[3]."\t".$req_count."\t".$per_req1."%\t".$cul_per_req1."%\t".$imp_count."\t".$per_imp1."%\t".$cul_per_imp1."%\t".$rev_cou\
nt."\t".$per_rev1."%\t".$cul_per_rev1."%"."\n";

}

close(FILE1);




