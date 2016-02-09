  use strict;
  use warnings;  
  use Win32::Sound;

Win32::Sound::Volume('100%');
    
while(1)
{

  my $range = 9;
  my $minimum = 3;

  my $random_number = int(rand($range)) + $minimum;
  
  sleep($random_number);
    
  Win32::Sound::Play("beep.wav");
  Win32::Sound::Stop();
    
}