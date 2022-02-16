#include "script/Batch Mockup Smart Object Replacement.jsx" 

var output = {
  path: '../../Batch-Mockup', // Outputs next to the mockup psd
  format: 'jpg', // 'jpg', 'png', 'tif', 'psd', 'pdf'
  filename: '@mockup - @input', 
};

mockups([
  
  // Mockup #1
  {
    output: output, 
    mockupPath: '../Batch-Mockup-Copy/assets/1cLogoMock.psd', 
    smartObjects: [
      // Smart object #1
/*      {
        target: '@screen',
        input: [
          '../processing'
        ], 
        inputNested: true,
        align: 'center center',
        resize: 'fit', 
      },
      // Smart object #2
      */{
        target: '@wideonwhite',
        input: [
          '../1cLogoMock_PROCESSING'
        ], 
        inputNested: true,
        align: 'center center',
        resize: 'fit', 
      },
      // Smart object #3
      {
        target: '@stackedonwhite',
        input: [
          '../1cLogoMock_PROCESSING'
        ], 
        inputNested: true,
        align: 'center center',
        resize: 'fit', 
      },
      // You could have more smart objects per mockup file...
      // {},
    ]
  },
 
  // You could have more mockup files...
  // {},
    
]);
