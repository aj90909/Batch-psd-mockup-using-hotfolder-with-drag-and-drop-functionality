# A hotfolder to create psd mockups or to run any .jsx file etc

# Intro

n/a - in dev

big credit to : https://github.com/joonaspaakko/Batch-Mockup-Smart-Object-Replacement-photoshop-script

and : https://github.com/paskalito/hotfolder

![This is an image](https://raw.githubusercontent.com/aj90909/Batch-mockup/main/dragndrop.gif)![This is an image](https://raw.githubusercontent.com/aj90909/Batch-mockup/main/listener.gif)

# Requirements

Install git bash for windows. Select option to allow right click in folder.
 
https://gitforwindows.org/

Install imagemagick 

https://imagemagick.org/script/download.php

Download repo and unzip

for ".\functions\1cLogoMock.cmd", edit this to path of photoshop.exe and "Batch-Mockup\Batch-Mockup-Copy\Batch replace example (1cLogoMock).jsx"

# Start

>right click in folder -> run git bash here

```
bash ./color.sh
```

# Use

>Drop 1c logo in 1cLogoMock_IN

>Mockup will be generated in ./

# Key features

#### color.ppm

.ppm file generated from imagemagick. pulls from histogram, chooses pixel of greatest occurence

#### batch-mockup-copy/script/Batch Mockup Smart Object Replacement.jsx

Engine script. line 184 updates ppm file. line 185 is code you can add before mockup export, after smart objects are updated (eg: point sample)

credit: 

https://github.com/joonaspaakko/Batch-Mockup-Smart-Object-Replacement-photoshop-script 

#### color.sh

Modified version of https://github.com/paskalito/hotfolder

#### Batch replace example (1cLogoMock).jsx

settings file. calls mockup files and layers. edit this for multiple mockups / settings

credit:

https://github.com/joonaspaakko/Batch-Mockup-Smart-Object-Replacement-photoshop-script

## Folder Tree

│   color.ppm

│   color.sh

│

├───1cLogoMock_IN

├───1cLogoMock_OUT

├───1cLogoMock_PROCESSING

├───Batch-Mockup-Copy

│   │   Batch replace example (1cLogoMock).jsx

│   │

│   ├───assets

│   │       1cLogoMock.psd

│   │       @stackedonwhite.PSB

│   │       @wideonwhite.PSB

│   │

│   └───script

│           Batch Mockup Smart Object Replacement.jsx

│

└───functions

│           1cLogoMock.cmd

# Issues
### magick histogram sorting
magick histogram (line 72 of color.sh) needs to ignore any line that matches pattern F\*F\*F. This may cause issues in some instances of light logos

manual input to git bash example:
 
```
magick convert "Coca-Cola_logo.svg" -colors 5 -depth 8 -format "%c" histogram:info: | sort -n -k 1 -r | sed -n '/F[^[]*F[^[]*F/!p' | head -n 1 | sed 's/.*(//' | sed 's/,/ /g' | sed 's|\(.*\) .*|\1|' | awk '{print "P3 1 1 255 " $0}'
```

git bash output: 

```
P3 1 1 255 230 29 43

```

**line 72 of color.sh:** 

```
magick convert ./* -colors 5 -depth 8 -format "%c" histogram:info: | sort -n -k 1 -r | sed -n '/F[^[]*F[^[]*F/!p' | head -n 1 | sed 's/.*(//' | sed 's/,/ /g' | sed 's|\(.*\) .*|\1|' | awk '{print "P3 1 1 255 " $0}'>../color.ppm
```

