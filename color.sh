#!/bin/bash

# What should this instance of hotfolder do?
# Fill in the name of the function you want to use
FUNCTION=1cLogoMock

# The Following options are available:

# convert_pictures - Convert and Resize Pictures (uses ImageMagik)
# convert_video - Convert/Compress Videos (uses HandBrake_CLI)
# make_me_gif - Convert a bunge of picures into an animated gif (choose your outputsize) (uses ImageMagik)
# compress_pdf - Compress PDF's (uses Ghostscript)
# make_panorama - [EXPERIMENTAL] Stiches panorama Shots toghether into one Panorama Image (uses hugin)
# zip - Zip files (uses zip)
# convert_audio - Convert/Compress/Extract Audio Files (uses ffmpeg)



# ------------------------ code (Do not edit below) ---------------------------------------------

# Finding path to itself
RELPATH=$(dirname "$0")

# cd into it
cd "$RELPATH"

#make 3 new directories
mkdir 1cLogoMock_IN 1cLogoMock_OUT 1cLogoMock_OUT


# mechanism to restart converting videos if script was aborted(computer shutdown)
FOLDERSIZE=`du -s processing | cut -f1`

# find processing/ -type f -iname *_converted* -exec rm -f {} \;
find processing/ -type f \( -name '*_converted*' -or -name '*_compressed*' \) -exec rm -f {} \;
mv processing/* 1cLogoMock_IN



#open a loop
while :
do


if ! [ "$(ls -A 1cLogoMock_IN)" ]; then
	echo 'The "in" Folder is Empty'
	# to reduce processing load lets wait some seconds till we check again.	
	sleep 5
else
	echo 'Oh something is in the "in" Folder let us watch it more closely'
	#check the size of folder in, wait 5 second check again.
	FOLDERSIZE1=`du -s 1cLogoMock_IN | cut -f1`
	echo $FOLDERSIZE1
	sleep 2
	FOLDERSIZE2=`du -s 1cLogoMock_IN | cut -f1`
	echo $FOLDERSIZE2
	sleep 2

		# if the first and secod time the foldersize didn't change and is grater than 0 start processing (we then assume that the copying into the in folder is finished)
		if [ "$FOLDERSIZE1" -eq "$FOLDERSIZE2" ] && [ "$FOLDERSIZE2" -gt 0 ]; then
			# Start Processing > Enter your code here
		  
			# move content from in folder to processing folder
			mv 1cLogoMock_IN/* 1cLogoMock_PROCESSING
			# go into 1cLogoOnBlackMock_PROCESSING folder / make it current path
			cd ./1cLogoMock_PROCESSING
			  
			# load a script from functions / here it actually starts the processing of the data
			# replaced source with . for bigger compatibility
#			for f in ./1cLogoMock_PROCESSING/*.; do
    # do some stuff here with "$f"
			magick convert ./* -colors 5 -depth 8 -format "%c" histogram:info: | sort -n -k 4 | head -n 1 | sed 's/.*(//' | sed 's/,/ /g' | sed 's|\(.*\) .*|\1|' | awk '{print "P3 1 1 255 " $0}'>../color.ppm
    # remember to quote it or spaces may misbehave
#			done
			sleep 2
			. ../functions/"$FUNCTION".cmd
#			. ../functions/movetocompleted.cmd
			# go up one level (because in the rest of the script we assume to be at the base level of our folderstructure)
			cd ..
			# move content from processing folder to out folder after some time
			sleep 25
			mv 1cLogoMock_PROCESSING/* 1cLogoMock_OUT
		else
			# this is somehow obsolete now but if there was a file with size 0 placed in the in folder this is where we would land.
			echo Size of in is still changing we assume someone is still copying their data into it.
			echo OR someone placed a file with size 0 in the in folder
		fi
fi

  
done
