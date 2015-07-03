package Blog;
  use strict;
  use warnings;
  our $VERSION = '1.00';
  use base 'Exporter';
  our @EXPORT = qw(doBlog);
  sub doBlog {
      return 1;
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
  1;