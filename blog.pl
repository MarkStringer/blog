use warnings;    
use Text::Markdown 'markdown';
use Net::FTP;
use File::Copy;
use Net::Twitter;
use Scalar::Util 'blessed';
use URI::Escape;
use XML::RSS::SimpleGen;
use HTML::Entities;
use XML::Twig;
use Getopt::Long;
use Blog;

my $slash = getOsSlash();
my $tweet='';
my $username='';
my $password='';
my $BLOG_DIRECTORY = '.';
my $PUBLIC_DIRECTORY = "..".$slash."Public";
my $BLOG_URL = q<http://www.mumbly.co.uk/newblog/>;
my $FTP_BLOG_DIRECTORY = "newblog";
my $STYLE_SHEET="blogstyle.css";
my $RSS_FILE = "feed.rss";
my $BLOG_TITLE = "A Commonplace";
my $RSS_FEED = $BLOG_URL.$RSS_FILE;
my $RSS_ICON = "rss-icon-small.png";


GetOptions ('username=s' => \$username, 'password=s' => \$password, 'tweet' => \$tweet );
print "Username $username\n";
print "Password $password\n";
print "Tweet $tweet\n";
print "Slash $slash\n";

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
my $rss_frag = <<RSS;
<a href='$RSS_FEED' target="_blank"><img alt="RSS Icon" src='$RSS_ICON' title="RSS Feed" border="0"></a>
RSS

my $index_string="";

my $footer = <<FOOT;
</div>
</body>
</html>
FOOT

my @file_list = $BLOG_DIRECTORY.$slash.$STYLE_SHEET; ##start the file list with the style sheet
my $dir = $BLOG_DIRECTORY; ##get all the files in the directory
## Sort the files chronoligcally
my @dir = sortFilesChronologically($dir);
	
my @text_files;
##my @text_file_prefixes;
my @image_files;

foreach my $file (@dir)
{
	if ($file=~ /(.*)\.txt$/)
	{
		@text_files = (@text_files, $file); ## put together a list of text files
	}
	if ($file=~/(.*)\.(png|jpg|gif)$/)
	{
		@image_files = (@image_files, $file); ## put together a list of image files
	}		
}
my $file_index = 0;
my $new_text = " [New!] ";
##my $content_file ="";
##my $content_title="";

foreach my $file (@text_files)
{		
		my $file_prefix = getFilePrefix($file,"txt");
			
		## read in the whole file
		local $/=undef;
		$file = $BLOG_DIRECTORY.$slash.$file;
		 
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
		my $is_new="";
		if( -M $file < 7)
		{
			 $is_new=$new_text;
			## print "This file is newer";
		}
		$index_string = $index_string.$li_frag1.$link_frag1.$file_prefix.".htm".$link_frag2.$is_new.$file_prefix.$link_frag3.$li_frag2;
		
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
		 ## write the date
		 print FILE $date_frag1.$mdy.$date_frag2;
		 print FILE $html.$footer;
		 push (@file_list, $html_file);
		 close FILE;
		 $file_index++;
}

## create an index file
open FILE, ">".$BLOG_DIRECTORY.$slash."index.htm";
print FILE $header.$ul_frag1.$index_string.$ul_frag2.$rss_frag.$footer;
close FILE;
push (@file_list, $BLOG_DIRECTORY.$slash."index.htm");
## add the image files
@file_list = (@file_list, @image_files);

## ftp everything up to the blog site
my $ftp = Net::FTP->new("www.mumbly.co.uk", Debug => 0)
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
## make an entry in the dropbox public folder, so we can do a post on IFTTT 
open FILE, ">$PUBLIC_DIRECTORY$slash$year$mon$mday$sec\.txt";
print FILE $header.$ul_frag1.$index_string.$ul_frag2.$footer;
close FILE;

get_url( $BLOG_URL );
 
## just put the most recent article in the RSS feed
m{<li><a href="(.*?)">(.*?)</a></li>}sg;

my $content_file = $1;
my $content_title = $2;

## screen  scrape the RSS
rss_new( $BLOG_URL, "A Commonplace", "Thoughts about Agile and all Manner of Other Things" );
rss_language( 'en' );
rss_webmaster( 'mark.stringer@mumbly.co.uk' );
rss_twice_daily();
##get_url( $BLOG_URL );

local $/=undef;

open CONTENT, "<$content_file" || die "Failed to open $content_file";
my $content = <CONTENT>;

my $t= XML::Twig->new();
$t->parse( '<d><title>title</title><para>p 1</para><para>p 2</para></d>');

close CONTENT;

rss_item($BLOG_URL.uri_escape($content_file), $content_title, $content);
close CONTENT;

die "No items in this content?! {{\n$_\n}}\nAborting"
unless rss_item_count();
rss_save( $RSS_FILE, 45 );
#put this file on the server
$ftp->put($RSS_FILE)||die "failed to put $RSS_FILE";
$ftp->quit;