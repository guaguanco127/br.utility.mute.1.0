# Max/MSP Patches, Abstractions, Externals, RNBO, VSTs, and Ableton Max for Live 

## br.utility.mute.2.0
   
By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.utility.mute.2.0, with all related files, can be found here: [https://github.com/guaguanco127/br.utility.mute](https://github.com/guaguanco127/br.utility.mute)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9, or RNBO.

## Links

[About](#About)  
[Max/MSP Abstraction](https://github.com/guaguanco127/br.utility.mute/tree/main/MaxMSP%20Abstraction) To use as an abstraction within Max/MSP   
[Max/MSP RNBO for External or VST](https://github.com/guaguanco127/br.utility.mute/tree/main/RNBO%20Patchers%20for%20External%20or%20VST) To build your own Max external, or a VST or AU audio plugin (needs RNBO)  
[Ableton Max for Live Device](https://github.com/guaguanco127/br.utility.mute/tree/main/Ableton%20Max%20For%20Live) To use inside of Ableton Suite   

## <a name="About"></a>About

A click-free mute. Switching a gain straight from 1 to 0 cuts the wave mid-swing, and that jump is heard as a click. br.utility.mute moves the gain along a 10 ms S-curve instead: too fast to hear as a fade, smooth enough that nothing clicks, and it lands on true silence. Works at any sample rate.

You can use it as an abstraction within Max/MSP or as a Max for Live device within Ableton Live Suite. With RNBO you can also build your own Max external or VST/AU plugin from the included RNBO patch.

## <a name="New"></a>What's new in 2.0

- The fade is now a 10 ms S-curve that ends on true silence (1.0 used a 5 ms smoother that never fully reached 0).
- Mono and stereo versions, each with or without a Mute button (see [Which file?](#Files)).
- The mute inlet takes a signal as well as a number, so an LFO or a gate can chop the sound, and every edge is still faded.
- One RNBO patch now makes both the Max external and the VST3/AU plugin. Prebuilt externals are no longer included: the abstraction does the same job and more, so build an external only if you need one.
- The Max for Live parameter is named Mute, so it reads clearly in Live's automation lanes.
- File names changed (no more `.abs`), so 1.0 patches need the new name typed in. The inlets are in the same order: L, R, Mute, with 1 = mute.

## <a name="Files"></a>Which file?

| File | What it is |
|---|---|
| br.utility.mute.2.0 | Mono, no UI. The plain object to patch with |
| br.utility.mute.stereo.2.0 | Stereo, no UI. One gain for both channels, so L and R stay together |
| br.utility.mute.ui.2.0 | Mono, with a Mute button, ready for a [bpatcher] |
| br.utility.mute.stereo.ui.2.0 | Stereo, with a Mute button, ready for a [bpatcher] |
| _br.utility.mute.example.2.0 | Example patch: open this first |

The UI versions contain the plain version and have the same inlets and outlets, so either swaps in without rewiring. Open a UI version in patching mode for comments on how it is built.

## <a name="Use"></a>How To Use

Mono (br.utility.mute.2.0 and .ui.2.0):

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Audio In | Signal | | |
| 2 | Mute | Signal or Int (UI: Int only) | 0 - 1, 1 = silent | 0 |

Outlet 1: Audio Out (Signal)

Stereo (br.utility.mute.stereo.2.0 and .stereo.ui.2.0):

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Left In | Signal | | |
| 2 | Right In | Signal | | |
| 3 | Mute | Signal or Int (UI: Int only) | 0 - 1, 1 = silent | 0 |

Outlets 1 / 2: Left Out / Right Out (Signal)

Values between 0 and 1 give partial gain, and a mute signal that moves faster than the fade is smoothed to the same 10 ms. In the UI versions a number into the Mute inlet moves the button, so the screen always shows what you hear. Hover any inlet or outlet in Max for its description.
