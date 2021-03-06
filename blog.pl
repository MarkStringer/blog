#! /usr/local/bin/perl
use warnings; 

use Cwd;
use lib cwd;


use List::Util qw(shuffle);   
use Text::Markdown 'markdown';
use Net::FTP;
use File::Copy;
use Scalar::Util 'blessed';
use URI::Escape;
use HTML::Entities;
use XML::Twig;
use Getopt::Long;
use Blog;

my $slash = getOsSlash();
my $tweet='';
my $username='';
my $password='';
my $fast='';
my $BLOG_DIRECTORY = '.';
my $PUBLIC_DIRECTORY = "..".$slash."Public";
my $BLOG_PATH = 'newblog';
my $BLOG_URL = q<http://www.mumbly.co.uk/newblog/>;
my $FTP_BLOG_DIRECTORY = 'www/newblog';
my $STYLE_SHEET="blogstyle.css";
my $RSS_FILE = "feed.rss";
my $BLOG_TITLE = "A Commonplace";
my $RSS_FEED = $BLOG_URL.$RSS_FILE;
my $RSS_ICON = "rss-icon-small.png";


GetOptions ('username=s' => \$username, 'password=s' => \$password, 'fast=s'=>\$fast, 'orderfile=s'=>\$orderfile);
my $usageString = "perl blog.pl --username <username> --password <password> [fast=<fast>] --orderfile orderfile";

print "Username $username\n";
print "Password $password\n";
print "Slash $slash\n";
print "Fast $fast\n";
print "Order File $orderfile\n";
$username || die "No Username";
$password || die "No Password";
$orderfile || die "No order file";

my $header = <<HEAD;
<html>
<head>
<title>
$BLOG_TITLE
</title>
<meta charset='utf-8'>
<link href='$STYLE_SHEET' rel='stylesheet'>
</head>
<body id="main_body">
<div id="content">
<h3>$BLOG_TITLE</h3>
<span id="commonplace"><p><a href="http://en.wikipedia.org/wiki/Commonplace_book">What is a commonplace?</a></p></span>
HEAD
my $nav_frag1 = "<span id=\"link\">";
my $nav_frag2 = "</span>";
my $index_frag = $nav_frag1."<a href=\"/".$BLOG_PATH."\">Index</a>".$nav_frag2;
my $link_frag1 = "<a href=\"";
my $link_frag2 = "\">";
my $link_frag3 = "</a>";
my $ul_frag1 ="<ul id=\"index_ul\">";
my $ul_frag2 ="</ul>";
my $li_frag1 = "<li>";
my $li_frag2 = "</li>";
my $date_frag1="<h3>";
my $date_frag2="</h3>";
my $rss_frag = <<RSS;
<a href='$RSS_FEED' target="_blank"><img alt="RSS Icon" src='$RSS_ICON' title="RSS Feed" border="0"></a>
RSS

my $index_string="";

my $footer = <<FOOT;
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
</body>
</html>
FOOT

my @file_list = $BLOG_DIRECTORY.$slash.$STYLE_SHEET; ##start the file list with the style sheet
my $dir = $BLOG_DIRECTORY; ##get all the files in the directory
## Sort the files chronoligcally
my @dir = sortFilesChronologically($dir);
	
my @text_files;
my @random_files;
my @image_files;

if($orderfile && (open (ORDER, "<", $orderfile)))
{
     while (<ORDER>)
	{
              print;
              my $orderLine = $_;
              chomp $orderLine;
              open(my $fh, '<', $orderLine)|| die "Failed to open $orderLine";
              push @text_files, $orderLine;
	}
}
else
{
     $orderfile="";
}
@random_files = shuffle(@text_files);

foreach my $file (@dir)
{
	if ((!$orderfile)&&($file=~ /(.*)\.txt$/))
	{
		@text_files = (@text_files, $file); ## put together a list of text files
	}
	if ($file=~/(.*)\.(png|jpg|gif|svg)$/)
	{
		@image_files = (@image_files, $file); ## put together a list of image files
	}		
}
my $file_index = 0;

foreach my $file (@text_files)
{		
		my $file_prefix = getFilePrefix($file,"txt");
		$file =~ s/\s*$//g ;
		## read in the whole file
		local $/=undef;

                -r $file or die "File $file isn't readable";

		##get the date that the file was last accessed
		my $modified = (stat($file))[9];
		my ($d,$m,$y) = (localtime($modified))[3,4,5];
		my $mdy = sprintf '%d/%d/%d', $d, $m+1,  $y+1900;
	 
		open FILE,  $file or die "Couldn\'t open file: $file";
		my $string = <FILE>;
		close FILE;
		 
		## encode_entities($string);
		my $html = encode_entities($string, "\226\227");
		## convert to markdown
		$html = markdown($html);
		 
		my $html_file = $BLOG_DIRECTORY.$slash.$file_prefix."\.htm";
		$index_string = $index_string.$li_frag1.$link_frag1.$file_prefix.".htm".$link_frag2.$file_prefix.$link_frag3.$li_frag2;
		
		 ## create an html file
		 open FILE, ">"."$html_file" or die "Cannot create file: $!";
		 print FILE $header;
		 print FILE $index_frag;
		 if ($file_index > 0)
		 {
			print FILE $nav_frag1.$link_frag1.getFilePrefix($text_files[$file_index-1],"txt").".htm".$link_frag2."Next".$link_frag3.$nav_frag2;
		 }
		 if ($file_index < $#text_files)
		 {
			print FILE $nav_frag1.$link_frag1.getFilePrefix($text_files[$file_index+1],"txt").".htm".$link_frag2."Previous".$link_frag3.$nav_frag2;
		 }
                 ## write a link to a random blog file here
                 print FILE $nav_frag1.$link_frag1.getFilePrefix($random_files[$file_index],"txt").".htm".$link_frag2."Random".$link_frag3.$nav_frag2;
		 ## write the date
		 print FILE $date_frag1.$mdy.$date_frag2;
		 print FILE $html.$footer;
		 push (@file_list, $html_file);
		 close FILE;
		 $file_index++;
}

##shorten the file list so only recent files are push to the server
my @short_file_list;
my @short_image_files;
if ($fast)
{
	for( my $i=0; $i<$fast; $i++)
	{
		## just put the top n files on the server
		@short_file_list = (@short_file_list, shift @file_list);
		@short_image_files = (@short_image_files, shift @image_files);  
	}
	@file_list = @short_file_list;
	@image_files = @short_image_files;
}

print @file_list;

## create an index file
open FILE, ">".$BLOG_DIRECTORY.$slash."index.htm";
print FILE $header.$ul_frag1.$index_string.$ul_frag2.$rss_frag.$footer;
close FILE;
push (@file_list, $BLOG_DIRECTORY.$slash."index.htm");


## add the image files
@file_list = (@file_list, @image_files);

## ftp everything up to the blog site
my $ftp = Net::FTP->new("ftp.mumbly.co.uk", Debug => 0, Passive => 1)
or die "Cannot connect to some.host.name: $@";
$ftp->login($username,$password)
or die "Cannot login ", $ftp->message;

$ftp->cwd("/".$FTP_BLOG_DIRECTORY )
or die "Cannot change working directory ", $ftp->message;
$ftp->binary;

foreach my $put_file (@file_list)
{
      print $put_file."\n";
      
      $ftp->put($put_file) or die "failed to put file $put_file";
}
 (my $sec, my$min, my $hour,my $mday, my $mon, my $year, my $wday, my $yday, my $isdst) =
localtime(time);

$ftp->quit;
