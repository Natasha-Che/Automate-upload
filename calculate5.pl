!/usr/bin/perl                                                                                                                                                      
$total_imp=0;
$total_req=0;
$total_rev=0;
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
 ($browser_name,$browser_ver,$os_type,$os_ver,$req,$imp,$rev)=(@a)=split /\t/, $line;
  push @{$some_hash{$browser_name}}, $req;
  push @{$some_hash1{$browser_name}},$imp;
  push @{$some_hash2{$browser_name}},$rev;
}

foreach $browser_name (sort keys %some_hash)
{$some_hash{$browser_name}=eval join '+', @{$some_hash{$browser_name}};
}

foreach $browser_name (sort keys %some_hash1)
{$some_hash1{$browser_name}=eval join '+', @{$some_hash1{$browser_name}};
}

foreach $browser_name (sort keys %some_hash2)
{$some_hash1{$browser_name}=eval join '+', @{$some_hash1{$browser_name}};
}
foreach $browser_name (sort keys %some_hash)
{
  $req_count=$some_hash{$browser_name};
  $imp_count=$some_hash1{$browser_name};
  $rev_count=int($some_hash2{$browser_name});

  print $browser_name."\t".$req_count."\t".$imp_count."\t".$rev_count."\n";

}

close(FILE1);
