cd %HOMEDRIVE%%HOMEPATH%
cd dropbox
cd blog
timeout /T 30 /NOBREAK > NUL
perl blog.pl yes_to_tweet
timeout /T 30 /NOBREAK > NUL
