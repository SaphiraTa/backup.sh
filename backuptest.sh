#!/bin/bash
# Backs up a single directory
# Created: 25/8/2020
 
if [ $# != 1 ]
then
    echo UsageWarning: Only use a single argument after scrip name, which is the directory to backup
    exit
fi
if [ ! -d ~/$1 ]
then
    echo 'The given directory does not seem to exist (possible typo?)'
    exit
fi
date=`date +%F`
 
# Do we already have a backup folder for todays date?
if [ -d /srv/usb-media/backups/$1_$date ]
then
    echo 'This project has already been backed up today, overwrite?'
    read answer
    if [ $answer != 'y' ]
    then
        exit
    fi
else
    mkdir /srv/usb-media/backups/$1_$date
fi
cp -R ~/$1 /srv/usb-media/backups/$1_$date
echo Backup of $1 completed
