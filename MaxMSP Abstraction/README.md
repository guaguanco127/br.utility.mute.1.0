# Max/MSP Abstraction: br.utility.mute.2.2  
   
By Brian Riordan  
[guaguanco127@gmail.com](mailto:guaguanco127@gmail.com)  
[brianriordanmusic@gmail.com](mailto:brianriordanmusic@gmail.com)  
[https://www.brianriordanmusic.com/](https://www.brianriordanmusic.com/) 
  
Repository for br.utility.mute.2.2, with all related files, can be found here: [https://github.com/guaguanco127/br.utility.mute](https://github.com/guaguanco127/br.utility.mute)  
Additional programs can be found here: [https://github.com/guaguanco127/br.max](https://github.com/guaguanco127/br.max)

These files were created with Max 9.

## Table of Contents 

[About](#About)   
[Which file?](#Files)  
[What is an abstraction?](#Abstraction)  
[How To Install](#Install)  
[How To Use](#Use)  
[State outlet](#State) 

## <a name="About"></a>About

A click-free mute. Switching a gain straight from 1 to 0 cuts the wave mid-swing, and that jump is heard as a click. br.utility.mute moves the gain along a 10 ms S-curve instead: too fast to hear as a fade, smooth enough that nothing clicks, and it lands on true silence. Works at any sample rate.

## <a name="Files"></a>Which file?

| File | What it is |
|---|---|
| br.utility.mute.2.2 | Mono, no UI. The plain object to patch with |
| br.utility.mute.stereo.2.2 | Stereo, no UI. One gain for both channels, so L and R stay together |
| br.utility.mute.ui.2.2 | Mono, with a Mute button, ready for a [bpatcher] |
| br.utility.mute.stereo.ui.2.2 | Stereo, with a Mute button, ready for a [bpatcher] |
| _br.utility.mute.example.2.2 | Example patch: open this first (its stereo core tab shows br.utility.mute.stereo.2.2, the plain stereo version) |

The UI versions contain the plain version and have the same inlets and audio outlets (plus State last), so either swaps in without rewiring. Open a UI version in patching mode for comments on how it is built.

## <a name="Abstraction"></a>What is an Abstraction?

An abstraction is a subpatcher that is saved as an external file, and can be used just like a standard Max object. As long as your abstraction can be found in the Max file path, you can type its name into a new object box and it will be loaded directly into your patch.  

By saving your logic in an abstraction, you can create modules that can be used in future work with little or no additional programming.

## <a name="Install"></a>How To Install

1. Make sure you have Max 9 installed, and that the Max patch you are using is saved inside a folder.  

2. Copy the .maxpat files you want into the same folder as your patch. The UI versions need their plain version next to them (br.utility.mute.stereo.ui.2.2 uses br.utility.mute.stereo.2.2).

3. In your patch, create an object called br.utility.mute.stereo.2.2 (or any other name from the table above, without .maxpat). For a version with a button, create a [bpatcher] and choose br.utility.mute.stereo.ui.2.2.maxpat as its patcher.

## <a name="Use"></a>How To Use

Mono (br.utility.mute.2.2 and .ui.2.2):

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Audio In | Signal | | |
| 2 | Mute | Signal or Int (UI: Int only) | 0 - 1, 1 = silent | 0 |

Outlet 1: Audio Out (Signal)  
Outlet 2 (UI version only): State (Message), see [State outlet](#State)

Stereo (br.utility.mute.stereo.2.2 and .stereo.ui.2.2):

| Inlet | Control | Type | Range | Default |
|---|---|---|---|---|
| 1 | Left In | Signal | | |
| 2 | Right In | Signal | | |
| 3 | Mute | Signal or Int (UI: Int only) | 0 - 1, 1 = silent | 0 |

Outlets 1 / 2: Left Out / Right Out (Signal)  
Outlet 3 (UI version only): State (Message), see [State outlet](#State)

Values between 0 and 1 give partial gain, and a mute signal that moves faster than the fade is smoothed to the same 10 ms. In the UI versions a number into the Mute inlet moves the button, so the screen always shows what you hear. Hover any inlet or outlet in Max for its description.

## <a name="State"></a>State outlet

The last outlet of the UI versions (State) sends the button's current mute as a named message the moment it changes: `mute 1` or `mute 0`. Use it to keep a display, Mira or another patch in sync. Pick it out by name with [route mute], not by position, so your patch keeps working if a later version adds controls. Repeats are filtered out.

| Message | Type | Range |
|---|---|---|
| mute | Int | 0 - 1, 1 = silent |

The plain versions have no State outlet: whatever drives them already knows the value. If you send the state straight into a [poly~], poly~ reads `mute` as its own command, so route it by name first. The example patch has a State outlet tab that shows all of this.


Double-click the object to see inside it and study how it was built.
