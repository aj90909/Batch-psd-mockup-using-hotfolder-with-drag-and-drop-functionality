# Batch-mockup

**Intro**

n/a - in dev

**Requirements**

Install git bash for windows. Select option to allow right click in folder.
 
https://gitforwindows.org/

Install imagemagick 

https://imagemagick.org/script/download.php

Download repo and unzip

**Start**

>right click in folder -> run git bash here

```
bash ./color.sh
```

**Use**

>Drop 1c logo in 1cLogoMock_IN

>Mockup will be generated in ./

**Key features**

**color.ppm**

.ppm file generated from imagemagick. pulls from histogram, chooses pixel of greatest occurence

**batch-mockup-copy/script/Batch Mockup Smart Object Replacement.jsx**

Engine script. line 184 updates ppm file. line 185 is code you can add before mockup export, after smart objects are updated (eg: point sample)

credit: 

https://github.com/joonaspaakko/Batch-Mockup-Smart-Object-Replacement-photoshop-script 

**Batch replace example (1cLogoMock).jsx**

settings file. calls mockup files and layers. edit this for multiple mockups / settings

credit:

https://github.com/joonaspaakko/Batch-Mockup-Smart-Object-Replacement-photoshop-script

**.\functions\1cLogoMock.cmd**

edit this to path of photoshop.exe and "Batch-Mockup\Batch-Mockup-Copy\Batch replace example (1cLogoMock).jsx"

**Folder Tree**

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

        1cLogoMock.cmd
