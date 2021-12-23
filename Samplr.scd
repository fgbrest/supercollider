// SAMPLR
s.boot
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/gudrun.wav");
c = Buffer.read(s, Platform.resourceDir +/+ "sounds/ulrike.wav");

// accelerating pitch
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    var rate;
    rate = XLine.kr(0.1, 100, 60);
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)*rate, 1.0, 0.0, 1.0)
    )
}).play(s, [\out, 0, \bufnum, b]);


// mouse control of trigger rate and startpos
SynthDef(\help_PlayBuf, { arg out=0, bufnum=0;
    var trig;
    trig = Impulse.kr(MouseY.kr(0.5, 200, 1));
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), trig, MouseX.kr(0, BufFrames.kr(bufnum)), 1)
    )
}).play(s, [\out, 0, \bufnum, b]);

SynthDef(\help_PlayBuf, { arg out=0, bufnum=0;
    var trig;
    trig = Impulse.kr(MouseY.kr(0.5, 200, 1));
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), trig, MouseX.kr(0, BufFrames.kr(bufnum)), 1)
    )
}).play(s, [\out, 1, \bufnum, c]);






b.free;