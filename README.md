# robotsRoundUp

Purpose:  Use this bash script to quickly automate the downloading of robots.txt 
from a provided hit-list of URLs.

1)  Make this Bash script executable
2)  Compile your target URLs into one massive hit-list  
3)  Make sure to add (or update) this script to point to the location of hit-list
4)  Run script

This script will go down the hit list and pull the supplied URLs and pass them over
to wget for downloading.  The page will be downloaded as robots.txt, but will
later be renamed to whatever the URL was (for consolidating and organizing purposes).

There is really only one thing to verify in this script: just confirm the path of
the URL hit-list matches matches the location of your own list.


This Bash script was written by James Russell.

Usage: ./robotsRoundUp.sh

