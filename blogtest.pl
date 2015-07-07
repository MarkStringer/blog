use Blog;
use Data::Compare;
use Test::Simple tests => 4;

ok(getOsSlash(), "Get os slash is returning... : ".getOsSlash()); ## does it return anything?
##ok(getOsSlash()eq'/', "should pass if on linux");
ok(getOsSlash()eq'\\', "should pass if on windows");

## create a directory
mkdir ("testdir") || die "Failed to create test directory \"testdir\"";
## write three files
open(TEST, ">testdir".getOsSlash()."NumberOne.txt");
print TEST "Something";
close TEST;
sleep(1);
open(TEST, ">testdir".getOsSlash()."NumberTwo.txt");
print TEST "Something";
close TEST;
sleep(1);
open(TEST, ">testdir".getOsSlash()."NumberThree.txt");
print TEST "Something";
close TEST;

## sort them in order of creation
## check this order is correct
(my $first, my $second, my $third) = sortFilesChronologically("testdir");
print $first."\n";
print $second."\n";
print $third."\n";
ok($first=~/Three/ && $second=~/Two/&&$third=~/One/, "Sorting files in chronological order");

## remove the files
## remove the directory
unlink "testdir".getOsSlash()."NumberThree.txt";
unlink "testdir".getOsSlash()."NumberTwo.txt";
unlink "testdir".getOsSlash()."NumberOne.txt";
rmdir("testdir") || die "failed to remove test directory";

ok(getFilePrefix("test.txt", "txt")=~/test/, "testing getFilePrefix");
