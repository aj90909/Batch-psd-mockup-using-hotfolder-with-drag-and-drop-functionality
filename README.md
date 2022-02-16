# Batch-mockup

# Intro

n/a - in dev

# Requirements

Install git bash for windows. Select option to allow right click in folder.
 
https://gitforwindows.org/

Install imagemagick 

https://imagemagick.org/script/download.php

Download repo and unzip

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

#### .\functions\1cLogoMock.cmd

edit this to path of photoshop.exe and "Batch-Mockup\Batch-Mockup-Copy\Batch replace example (1cLogoMock).jsx"

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

magick histogram (line 72 of color.sh) needs to ignore first line that matches pattern F*F*F* which would void white/light tones, the most commonly occuring pixel color

Input to git bash example (first line matches pattern, includes "FFFEFEFF"):
 
```
magick convert "Coca-Cola_logo.svg" -colors 5 -depth 8 -format "%c" histogram:info: | sort -n -k 1 -r
```

git bash output: 

```
    76249: (255,254,254,255) #FFFEFEFF srgba(255,254,254,1)
    38674: (230,29,43,255) #E61D2BFF srgba(230,29,43,1)
    1579: (244,160,166,255) #F4A0A6FF srgba(244,160,166,1)
    1269: (236,83,94,255) #EC535EFF srgba(236,83,94,1)
    924: (240,123,131,255) #F07B83FF srgba(240,123,131,1)
```

**line 72 of color.sh:** 

```
magick convert ./* -colors 5 -depth 8 -format "%c" histogram:info: | sort -n -k 4 | head -n 1 | sed 's/.*(//' | sed 's/,/ /g' | sed 's|\(.*\) .*|\1|' | awk '{print "P3 1 1 255 " $0}'>../color.ppm
```
