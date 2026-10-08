{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 85.0, 104.0, 760.0, 300.0 ],
        "description": "br.utility.mute.2.1 -- Created by Brian Riordan, guaguanco127@gmail.com -- https://github.com/guaguanco127/",
        "boxes": [
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-signature",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 15.0, 401.0, 33.0 ],
                    "text": "br.utility.mute.2.1 -- Created by Brian Riordan, guaguanco127@gmail.com\nhttps://github.com/guaguanco127/"
                }
            },
            {
                "box": {
                    "comment": "Audio In (Signal)",
                    "id": "obj-in1",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 15.0, 15.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Mute (Signal/Int) 0/1. 1 = silent, 10 ms S-curve fade. Default 0",
                    "id": "obj-in2",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 165.0, 15.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-gen",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 4,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 100.0, 100.0, 700.0, 600.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 20.0, 200.0, 22.0 ],
                                    "text": "in 1 @comment \"Audio In (Signal)\""
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-2",
                                    "linecount": 3,
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 265.0, 20.0, 200.0, 22.0 ],
                                    "text": "in 2 @comment \"Mute (Signal/Int) 0/1. 1 = silent, 10 ms S-curve fade. Default 0\""
                                }
                            },
                            {
                                "box": {
                                    "code": "// br.utility.mute.2.1 -- click-free mute\n// Created by Brian Riordan, guaguanco127@gmail.com -- https://github.com/guaguanco127/\n// MUST MATCH: the stereo version uses the same fade, one gain for both channels\n// in1 audio, in2 mute 0/1, 1 = mute, signal or number\n// out1 audio\n// The fade is a raised-cosine S-curve that takes exactly 10 ms end to end:\n// it leaves and lands gently, with no corner to click, and reaches true silence,\n// which a one-pole smoother never quite does.\n// Mute values between 0 and 1 give partial gain; a moving mute signal is slew-limited to the same 10 ms.\n\n// fade position: 0 = playing, 1 = muted\nHistory pos(0);\n\ngoal = clamp(in2, 0, 1);\ninc = 1 / mstosamps(10);\np = pos;\nif (p < goal) {\n    p = min(p + inc, goal);\n}\nelse if (p > goal) {\n    p = max(p - inc, goal);\n}\n// p 0 -> gain 1, p 1 -> gain 0\ng = 0.5 + 0.5 * cos(p * pi);\nout1 = in1 * g;\npos = p;\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-3",
                                    "maxclass": "codebox",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 70.0, 560.0, 420.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-4",
                                    "linecount": 2,
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 510.0, 200.0, 22.0 ],
                                    "text": "out 1 @comment \"Audio Out (Signal)\""
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 1 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 15.0, 96.0, 180.0, 22.0 ],
                    "text": "gen~ @title br.utility.mute.2.1"
                }
            },
            {
                "box": {
                    "comment": "Audio Out (Signal)",
                    "id": "obj-out1",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 15.0, 140.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-why",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 344.0, 70.0, 520.0, 74.0 ],
                    "text": "click-free mute: 1 = silent, 0 = playing. The gain follows a 10 ms S-curve, so it never jumps (a jump = a click) and lands on true silence. The mute inlet takes a number or a signal; values in between give partial gain. State outlet (last): every number that changes the mute goes out as mute 0 / mute 1, through [change 0] so repeats are dropped. Signals feed the gen~ only and are not reported."
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 220.0, 130.0, 72.0, 22.0 ],
                    "text": "change 0"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 160.0, 100.0, 22.0 ],
                    "text": "prepend mute"
                }
            },
            {
                "box": {
                    "comment": "State (Message): mute 0 / mute 1, sent the moment the mute changes. Numbers only (a signal mute is not reported). Pick it out by name: [route mute]",
                    "id": "obj-3",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 200.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out1", 0 ],
                    "source": [ "obj-gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 0 ],
                    "source": [ "obj-in1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-in2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-gen", 1 ],
                    "order": 1,
                    "source": [ "obj-in2", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}