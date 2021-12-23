s.boot

MIDIClient.init;
m = MIDIOut.new (1);

TempoClock.default.tempo = 70/60;
// expermientos
HenonN.ar(freq, 1.4,0.3);
// sample
(
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/crash.wav");

// one loop segment
SynthDef(\oneLoop, { |out, bufnum, start, time, amp|
    var    sig = PlayBuf.ar(1, bufnum, startPos: start, loop: 0),
        env = EnvGen.kr(Env.linen(0.01, time, 0.05, level: amp), doneAction: Done.freeSelf);
    Out.ar(out, (sig * env) ! 2)
}).add;

SynthDef(\bell, { |out, accent = 0, amp = 0.1, decayScale = 1|
    var    exc = PinkNoise.ar(amp)
            * Decay2.kr(Impulse.kr(0), 0.01, 0.05),
        sig = Klank.ar(`[
            { ExpRand(400, 1600) } ! 4,
            1 ! 4,
            { ExpRand(0.1, 0.4) } ! 4
        ], exc, freqscale: accent + 1, decayscale: decayScale);
    DetectSilence.ar(sig, doneAction: Done.freeSelf);
    Out.ar(out, sig ! 2)
}).add;
)

(
TempoClock.default.tempo = 0.35953685899971 * 4;

p = Ptpar([
    0, Pbind(
        \instrument, \oneLoop,
        \bufnum, b,
        \amp, 0.4,
        \start, 17841,
        \time, 0.35953685899971.reciprocal,
        \dur, 4
    ),
    0.5, Pn(
        Pfindur(4,
            Pbind(
                \instrument, \bell,
                \accent, Pseq([2, Pn(0, inf)], 1),
                \amp, Pseq([0.3, Pn(0.1, inf)], 1),
                \decayScale, Pseq([6, Pn(1, inf)], 1),
                \dur, Pwrand(#[0.25, 0.5, 0.75, 1], #[2, 3, 1, 1].normalizeSum, inf)
            )
        ),
    inf),
    0.5, Pbind(
        \instrument, \bell,
        \accent, -0.6,
        \amp, 0.2,
        \decayScale, 0.1,
        \dur, 1
    )
], 1).play;
)

p.stop;

// make a sound sample
(
var    recorder;
fork {
    b = Buffer.alloc(s, 44100 * 2, 1);
    s.sync;
    recorder = { |freq = 440|
        var    initPulse = Impulse.kr(0),
            mod = SinOsc.ar(freq) * Decay2.kr(initPulse, 0.01, 3) * 5,
            car = SinOsc.ar(freq + (mod*freq)) * Decay2.kr(initPulse, 0.01, 2.0);
        RecordBuf.ar(car, b, loop: 0, doneAction: Done.freeSelf);
        car ! 2
    }.play;
    o = OSCFunc({ |msg|
        if(msg[1] == recorder.nodeID, {
            "done recording".postln;
            o.free;
        });
    }, '/n_end', s.addr);
};
SynthDef(\sampler, { |out, bufnum, freq = 1, amp = 1|
    var    sig = PlayBuf.ar(1, bufnum, rate: freq, doneAction: Done.freeSelf) * amp;
    Out.ar(out, sig ! 2)
}).add;
)

(
// WAIT for "done recording" message before doing this
var    samplerEvent = Event.default.put(\freq, { ~midinote.midicps / ~sampleBaseFreq });

TempoClock.default.tempo = 1;
p = Pbind(
    \degree, Pwhite(0, 12, inf),
    \dur, Pwrand([0.25, Pn(0.125, 2)], #[0.8, 0.2], inf),
    \amp, Pexprand(0.1, 0.5, inf),
    \sampleBaseFreq, 440,
    \instrument, \sampler,
    \bufnum, b
).play(protoEvent: samplerEvent);
)

p.stop;
b.free;



// cosos
SynthDef(\harpsis, { |outbus = 0, freq = 440, amp = 0.1, gate = 1|
    var out;
    out = EnvGen.ar(Env.adsr, gate, doneAction: Done.freeSelf) * amp *
        Pulse.ar(freq, 0.25, 0.75);
    Out.ar(outbus, out ! 2);
}).add;    // see below for more on .add

(
~piano = Pbind(
	\scale, Scale.spanish,
    \root, ~root,
	\degree, ~degree,
    \dur,~dur,
	\amp, ~amp
).play;
)
~piano.play;~pianos.play;

(
~pianos = Pbind(
	\type, \midi,
	\midicmd, \noteOn,
	\midiout, m,
	\chan, 0,
	\scale, Scale.spanish,
    \root, ~root,
	\degree, ~degree,
    \dur,~dur,
	\amp, ~amp

).play;
)

// ARMAR
~root = 0;
~degree = PatternProxy(Pseq([Pwhite(0, 12, 8).clump(2).do { |x| x.postln }], inf));
~dur = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp = PatternProxy(Pexprand(50,90,inf)/127);
// RAíZ
~root.source = (Pseq([4,-1,-4],inf));
~root.source = -12;
// GRADO
~degree.source = Pseq([1,4,6],inf);
~degree.source = Pseq([2,6,7],inf);
~degree.source = Pseq((1..8),inf);
~degree.source = Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf);
~degree.source = 1;
~degree.source = 0;
~degree.source = Pseq([0,0,4,5,4,5,4,0.1],inf);
// RITMO
~dur.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));~degree.source = 1;
~dur.source = (Pseq([1,2,1,0.5],inf));~degree.source = Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf);
~dur.source = 1/8;~degree.source = Pseq((1..8),inf);
~dur.source = 1/4;~degree.source = Pseq([0,0,4,5,4,5,4,0.1],inf);
~dur.source = Pseq([1/8,1/8,1/8,1/8,1/4,1/4,1/2],inf);
~dur.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
// DINÁMICA
~amp.source = Pseq([25,30,65,25,50],inf)/127;
// CONTROLES
~pianos.play;~piano.play;
~pianos.stop;~piano.stop;