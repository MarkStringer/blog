use strict;
use Mail::IMAPClient;
use MIME::QuotedPrint;
my $debug = 0;
my $host = 'imap.gmail.com';
my $id = 'mark.stringer@gmail.com';
my $GETBLOGSCRIPT = 'RunBlog.bat';
my $textFile;
my $loop;
my $blogPosts = 0;

while(sleep 50)
{

if ($debug)
{
	$textFile = '..//TestText.txt';
}
else
{
	$textFile = '..//Text.txt';
}
my $dealWithFolder = 'Dealt With';

my $imap = Mail::IMAPClient->new(
 Server   => $host,
 Port     => 993,
 Ssl      => 1,
 User     => $id, # your gmail address
 Password => 'aeclpgoditkczahv', # your password *
 )
 or die "new(): $@";

print "I'm authenticated\n" if $imap->IsAuthenticated();

$imap->select("INBOX") or die "Could not select: $@\n";

$imap->Uid(1);
my $body;
my $date;
##my @recent = $imap->recent or warn "No recent msgs: $@\n";
my @msg = $imap->messages or die "Could not messages: $@\n";
# for loop execution
	for( my $a = $#msg; $a > ($#msg-100); $a = $a - 1 ){
		if (($imap->subject($msg[$a]) =~ /.*(MailText)(.*)/i)||(($imap->subject($msg[$a]) =~ /.*(MailBlog)(.*)/i)))
		{
			my $postType = $1;
			my $title = $2;
			my $titleWithPunctuation = $title;
			$title =~ s/\W+/ /sg;
			
			print $imap->subject($msg[$a])."\n";
			$imap->see($msg[$a]);
			
			## decode the body from fixed-width format
			$body =  decode_qp($imap->bodypart_string($msg[$a], 1));
			##remove the signature
			$body =~ s/(.*)IMPORTANT NOTICE:.*/$1/s;
			print $body;
			$date ="\n".$imap->date($msg[$a]);
			##get rid of the trailing numbers after the plus
			$date =~ s/(.*?)\+(.*)/$1/gs;
			## move this message to the Dealt With folder
			my $newUid = $imap->move( $dealWithFolder, $msg[$a] )
			or die "Could not move: $@\n";
			$imap->expunge;

			my $fileopenString;
			if ($postType =~ /MailText/)
			{	$fileopenString = ">>$textFile"; }
			else ## this is Blog Text
			{	$fileopenString = ">$title\.txt";
				$blogPosts = 1;
				$titleWithPunctuation = '#'.$titleWithPunctuation;
			}

			## write this to the text file
			open(my $fd, $fileopenString) || die "failed to open file";
			print $fd $date."\n\n"."$titleWithPunctuation\n\n$body";
			close($fd);
		}
	}

	$imap->close;

	$|++;

	if ($blogPosts)
	{
		system ($GETBLOGSCRIPT);
		$blogPosts = 0;
	} 

	
}