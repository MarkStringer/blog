  # A complete screen-scraper and RSS generator here:
  
  use strict;
  use XML::RSS::SimpleGen;
  use URI::Escape;
  my $url = q<http://www.mumbly.co.uk/newblog/>;
  
  rss_new( $url, "A Commonplace", "Thoughts about Agile and all Manner of Other Things" );
  rss_language( 'en' );
  rss_webmaster( 'mark.stringer@mumbly.co.uk' );
  rss_twice_daily();
  
  get_url( $url );
  
  while(
   m{<li><a href="(.*?)">(.*?)</a></li>}sg
   ## <li><a href="Hungry Ghost.htm">Hungry Ghost</a></li>
  ) {
    rss_item($url.uri_escape($1), $2);
  }
  
  die "No items in this content?! {{\n$_\n}}\nAborting"
   unless rss_item_count();
  
  rss_save( 'feed.rss', 45 );
  exit;