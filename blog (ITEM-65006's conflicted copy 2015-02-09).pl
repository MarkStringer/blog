use strict;
use warnings;    
use Text::Markdown 'markdown';
use Net::FTP;
use File::Copy;
use Net::Twitter;
use Scalar::Util 'blessed';
use URI::Escape;

my $tweet;
my $BLOG_DIRECTORY = '.';
my $EMAIL_DIRECTORY = "..\\Apps\\Attachments";
my $FTP_BLOG_DIRECTORY = "newblog";
my $STYLE_SHEET="blogstyle.css";
my $BLOG_TITLE = "A Commonplace";

print "Number of Arguments $#ARGV\n";
if ($#ARGV >= 0)
{
	## really basic command line argument handling - if there's an argument, tweet (how appropriate)
	$tweet = 1;
}


opendir (DIR,  $BLOG_DIRECTORY) or die $!;

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
my $index_frag = $nav_frag1."<a href=\"/".$FTP_BLOG_DIRECTORY."\">Index</a>".$nav_frag2;
my $link_frag1 = "<a href=\"";
my $link_frag2 = "\">";
my $link_frag3 = "</a>";
my $ul_frag1 ="<ul id=\"index_ul\">";
my $ul_frag2 ="</ul>";
my $li_frag1 = "<li>";
my $li_frag2 = "</li>";
my $date_frag1="<h3>";
my $date_frag2="</h3>";
my $index_string="";

my $googleTracker = <<GOOGLETRACKER;
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-3476939-2', 'auto');
  ga('send', 'pageview');

</script>
GOOGLETRACKER

my $footer = <<FOOT;
</div>
$googleTracker
</body>
</html>
FOOT

my @file_list = $BLOG_DIRECTORY."\\".$STYLE_SHEET;
my $dir = $BLOG_DIRECTORY;
## Sort the files chronoligcally
opendir (DIR, $dir);
     my @dir=readdir(DIR);
        closedir(DIR);
         @dir = sort { -M "$dir/$a" <=> -M "$dir/$b" } (@dir);
	
my @text_files;
my @text_file_prefixes;
my @image_files;

foreach my $file (@dir)
{
	if ($file=~ /(.*)\.txt$/)
	{
		@text_file_prefixes = (@text_file_prefixes, $1);
		@text_files = (@text_files, $file);
	}
	if ($file=~/(.*)\.(png|jpg|gif)$/)
	{
		@image_files = (@image_files, $file);
	}		
}
my $file_index = 0;

foreach my $file (@text_files)
{		
		$file=~ /(.*)\.txt$/;
		my $file_prefix = $1;
		## read in the whole file
		 local $/=undef;
		 $file = $BLOG_DIRECTORY."\\".$file;
		 
		 ##get the date that the file was last accessed
		  my $modified = (stat($file))[9];
		  my ($d,$m,$y) = (localtime($modified))[3,4,5];
		  my $mdy = sprintf '%d/%d/%d', $d, $m+1,  $y+1900;
		  ##print $mdy." \n";
		 
		 open FILE,  $file or die "Couldn\'t open file: $file";
		 my $string = <FILE>;
		 close FILE;
		 
		 ## convert to markdown
		 my $html = markdown($string);
		 my $html_file = $BLOG_DIRECTORY."\\".$file_prefix."\.htm";
		 $index_string = $index_string.$li_frag1.$link_frag1.$file_prefix."\.htm".$link_frag2.$file_prefix.$link_frag3.$li_frag2;
		 
		 ## create an html file
		 open FILE, ">"."$html_file" or die "Cannot create file: $!";
		 print FILE $header;
		 print FILE $index_frag;
		 if ($file_index > 0)
		 {
			 print FILE $nav_frag1.$link_frag1.$text_file_prefixes[$file_index-1].".htm".$link_frag2."Next".$link_frag3.$nav_frag2;
		 }
		 if ($file_index < $#text_files)
		 {
			  print FILE $nav_frag1.$link_frag1.$text_file_prefixes[$file_index+1].".htm".$link_frag2."Previous".$link_frag3.$nav_frag2;
		 }
		 ## write the date
		 print FILE $date_frag1.$mdy.$date_frag2;
		 print FILE $html.$footer;
		 push (@file_list, $html_file);
		 close FILE;
		 $file_index++;
}


## create and index file
open FILE, ">".$BLOG_DIRECTORY."\\"."index.htm";
print FILE $header.$ul_frag1.$index_string.$ul_frag2.$footer;
close FILE;
push (@file_list, $BLOG_DIRECTORY."\\"."index.htm");
## add the image files
@file_list = (@file_list, @image_files);

## ftp everything up to the blog site
my $ftp = Net::FTP->new("www.mumbly.co.uk", Debug => 0)
or die "Cannot connect to some.host.name: $@";
$ftp->login("strimaa",'4at7EVAD')
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
my @abbr = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

$ftp->quit;

if($tweet)
{
	my $nt = Net::Twitter->new(
	      traits   => [qw/API::RESTv1_1/],
	      consumer_key        => 'kIxOoYH65H3ZqtcxZYebme2xE',
	      consumer_secret     => 'EZ1QcJKh6Kub1NgVF9dr2eQ0xaq0ly8HtTlbDZsiGsEwdCTgN1',
	      access_token        => '23585156-X1VfR2LaNi6riffSEO7CrhNUQ3M4FPU0PdcHHyb2S',
	      access_token_secret => 'gzPrJsB3VQEEi0VRawkh0H7n6GzjTmDdjBpZLkOB4JMB0',
	      ssl                 => 1,  ## enable SSL! ##
	)|| die "failed to create twitter object $@";

	my $mostRecentPost = $file_list[1];
	$mostRecentPost =~ s/\.\\(.*)/$1/sg;
	my $postTitle = $mostRecentPost;
	$mostRecentPost = uri_escape($mostRecentPost);
	
	$postTitle =~ s/(.*)\.htm/$1/i;
	(length($postTitle) < 50) || ($postTitle = (substr($postTitle, 0, 50).'...'));

	my $result = $nt->update('New blog post '.$postTitle.' http://www.mumbly.co.uk/newblog/'.$mostRecentPost) 
	|| die "failed to tweet $@";
}