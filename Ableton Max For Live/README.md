# Ableton Max for Live device: br.utility.mute.2.1  
   
By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.utility.mute.2.1, with all related files, can be found here: [https://github.com/guaguanco127/br.utility.mute](https://github.com/guaguanco127/br.utility.mute)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9.

## Table of Contents 

[About](#About)  
[What is a Max for Live Device?](#M4L)  
[How To Install](#Install)  

## <a name="About"></a>About

A click-free mute. Switching a gain straight from 1 to 0 cuts the wave mid-swing, and that jump is heard as a click. br.utility.mute moves the gain along a 10 ms S-curve instead: too fast to hear as a fade, smooth enough that nothing clicks, and it lands on true silence. Works at any sample rate.

A stereo audio effect with one Mute button. Mute is a Live parameter, so you can automate it or map it to a controller. The separate "basic" device from 1.0 is gone; the commented teaching version now lives in the [Max/MSP abstractions](https://github.com/guaguanco127/br.utility.mute/tree/main/MaxMSP%20Abstraction) (br.utility.mute.stereo.ui.2.1).

## <a name="M4L"></a>What Is a Max For Live Device?

Max For Live brings the power and flexibility of Max to Ableton Live. Max For Live gives you access to hundreds of exclusive custom plug-ins (Live Devices) as well as the tools to build your own. These can be MIDI and audio effects, audio and video synthesizers, 3D Jitter visuals, as well as tools that interact with the Live application itself, via the Live API.

## <a name="Install"></a>How To Install

1. Make sure you have Ableton Live Suite installed on your computer, and that Live is closed while installing. 

2. For Mac:  
Go to your user folder  
Then Music > Ableton > User Library > Presets > Audio Effects > Max Audio Effect  
Copy br.utility.mute.2.1.amxd into that folder

3. For Windows: \Users\[username]\Documents\Ableton\User Library\Presets\Audio Effects\Max Audio Effect  
  
4. Open Ableton Live. On the left-hand side, look for Max for Live > Max Audio Effect and then the name of this device.

5. Either double-click the device, or drag it onto the track where you want it.
