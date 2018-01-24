#!/bin/bash


#+++++++++++++++++++++++++++++++++++++++
#Instructions for using robotsRoundup.sh
#+++++++++++++++++++++++++++++++++++++++
#
#Purpose:  Use this bash script to quickly automate the downloading of robots.txt 
#from a provided hit-list of URLs.
#
#1)  Make this Bash script executable
#2)  Compile your target URLs into one massive hit-list  
#3)  Make sure to add (or update) this script to point to the location of hit-list
#4)  Run script
#
#This script will go down the hit list and pull the supplied URLs and pass them over
#to wget for downloading.  The page will be downloaded as robots.txt, but will
#later be renamed to whatever the URL was (for consolidating and organizing purposes).
#
#There is really only one thing to verify in this script: just confirm the path of
#the URL hit-list matches matches the location of your own list.
#
#
#This Bash script was written by James Russell.
#
#Usage: ./robotsRoundUp.sh
#
#
#
#██████╗  ██████╗ ██████╗  ██████╗ ████████╗███████╗                                  
#██╔══██╗██╔═══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝                                  
#██████╔╝██║   ██║██████╔╝██║   ██║   ██║   ███████╗                                  
#██╔══██╗██║   ██║██╔══██╗██║   ██║   ██║   ╚════██║                                  
#██║  ██║╚██████╔╝██████╔╝╚██████╔╝   ██║   ███████║                                  
#╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝                                  
#                                                                                     
#        ██████╗  ██████╗ ██╗   ██╗███╗   ██╗██████╗ ██╗   ██╗██████╗ ███████╗██╗  ██╗
#        ██╔══██╗██╔═══██╗██║   ██║████╗  ██║██╔══██╗██║   ██║██╔══██╗██╔════╝██║  ██║
#        ██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ██║██║   ██║██████╔╝███████╗███████║
#        ██╔══██╗██║   ██║██║   ██║██║╚██╗██║██║  ██║██║   ██║██╔═══╝ ╚════██║██╔══██║
#        ██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝╚██████╔╝██║██╗  ███████║██║  ██║
#        ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚══════╝╚═╝  ╚═╝
#                                                                                     
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






#VERIFY ME!!! This is where you add the location of your URL hit-list
file=/home/jimmy/Desktop/robos/url-list


#Do not change this
robo='/robots.txt'


#Do not change this.  This is the loop that reads each line in the file, adds 
#robots.txt to the end, and is downloaded via wget
while IFS= read -r line
do
        wget $line$robo


#Do not change this.  This grabs the URL string that has been assigned to line 
#and cuts out the HTTP part.  The output is assigned to rename and will be used 
#to rename the downloaded robots file
rename=$(echo $line | cut -d "/" -f 3)


#Uncomment the sleep cmd if you want to slow the downloads down a bit, good to 
#do if you want to be quiet.
#sleep 10


#Do not change this.  Renames robots.txt to the URL it was pulled from.  
mv robots.txt $rename


done < "$file"
