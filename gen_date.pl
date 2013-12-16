#!/usr/bin/perl                                                                                                                                                      

    use List::Util 'shuffle';


    $T = time() - 3600*24*$ARGV[0];
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($T);
    $year += 1900;
    $mon ++;
    if($mon < 10) {$mon = "0".$mon;}
    if($mday < 10) {$mday = "0".$mday;}
    print $year.$mon.$mday,"\n";
