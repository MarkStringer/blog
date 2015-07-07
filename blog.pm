package Blog;

  use strict;
  use warnings;
  our $VERSION = '1.00';
  use Text::Markdown 'markdown';
  use Net::FTP;
  use File::Copy;
  use Net::Twitter;
  use Scalar::Util 'blessed';
  use URI::Escape;
  use XML::RSS::SimpleGen;
  use HTML::Entities;

  use Exporter 'import'; # gives you Exporter's import() method directly
  our @EXPORT = qw(doBlog getOsSlash sortFilesChronologically getFilePrefix);  # symbols to export on request
  
  sub doBlog {
      return 1;
  }
  
  sub getFilePrefix
  {
	  my $filename = $_[0];
	  my $suffix = $_[1];
	  $filename=~ /\W*(.*)\.$suffix$/;
	  return $1;
  }
  
  sub getOsSlash
  {
	  ## decide whether we're on windows or linux
	my $OperatingSystem= $^O;
	my $slash;

	if ($OperatingSystem =~ /linux/)
	{
		$slash='/';
	}
	else
	{
		$slash='\\';
	}
	return $slash;
  }
  
  sub sortFilesChronologically
  {
	  my $dir = $_[0]; ## argument passed in
	  opendir (DIR, $dir)||die "Failed to open target directory";
	  my @dir= grep { $_ ne '.' && $_ ne '..' }  readdir(DIR);
	  closedir(DIR);
	  @dir = sort { -M "$dir/$a" <=> -M "$dir/$b" } (@dir);
          return @dir;	  
  }
  1;