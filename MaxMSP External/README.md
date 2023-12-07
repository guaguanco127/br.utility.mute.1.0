# Max/MSP External: br.utility.mute.1.0~  
   
By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
Repository for br.utility.mute.1.0, with all related filtes, can be found here: [https://github.com/guaguanco127/br.utility.mute.1.0](https://github.com/guaguanco127/br.utility.mute.1.0)  
Additional programs can be found here: [https://github.com/guaguanco127](https://github.com/guaguanco127)

These files were created with Max/MSP version 8.5.6.

## Table of Contents 

[About](#About)   
[What is an External for Max/MSP?](#External)  
[How To Install](#Install)  
[How To Use](#Use) 
 
 

## <a name="About"></a>About

These files were created with Max/MSP version 8.5.6, or RNBO 1.2.3. Links on how to use and/or install below. 

This is a Max/MSP external object that allows the user to simply mute the signal without creating any clicks or pops. Currently works in any sample rate or bit depth.  

The two versions present in this folder are for either Macintosh or Windows. 

## <a name="External"></a>What is an External for Max/MSP?

An external is a type of object that does not come with your Max/MSP library. Unlike the typical objects that you can call on all versions of Max/MSP, an external must be installed on the users computer a specific way. 

## <a name="Install"></a>How To Install

1. Make Sure Max/MSP 8 is installed in your computer, and make sure it is turned off.

2. In your documents folder, find the Max 8 folder

3. If a folder called "Externals" is not there, then create one in this location. 

4. For Macintosh, copy and paste br.utility.mute.1.0~.mxo into this Externals folder

5. For Windows, copy and paste br.utility.mute.1.0~.mxe64 into this folder

6. Open Max/MSP

7. At the top of the screen find the dropdown menu called "Options" then select "File Preferences"

8. Find an empty userpath and select "choose"

9. From here, find and select the "Externals" folder where the external file was pasted to. Please note that you only have to select this user path within the File Preferences once.

## <a name="Use"></a>How To Use

Open up a patch in Max/MSP, create a new object called br.utility.mute.1.0~

If the installation worked then the object will now exist in your patch. 

This external works almost like the abstraction version. However, you are unable to click inside of an external. 

The first two inlets are for the left and the right stereo signals. The 3rd inlet takes an integer. 0 = bypass, 1 = mute. 


    



 





