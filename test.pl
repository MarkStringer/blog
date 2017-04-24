#!/usr/bin/perl -w
use Test::More tests => 2;

TODO: {
       my $line = "";
       is(-e 'order', 1, 'file exists');
       open (my $fh, '<', 'order');
       my $line = <$fh>;
       chomp $line;
       is(-r qq{$line},1, "-r $line");
    }


