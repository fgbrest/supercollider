gendy
s.boot

{ Pan2.ar(Gendy1.ar(initCPs:1)) }.play

(
{Pan2.ar(
Mix.new(Gendy3.ar(3,5,1.0,1.0,(Array.fill(5,{LFNoise0.kr(1.3.rand,1,2)})*MouseX.kr(100,378,'exponential')),MouseX.kr(0.01,0.05),MouseY.kr(0.001,0.016),5,mul:0.1)))}.play
)

(
var scale, buffer;
scale = FloatArray[0, 2, 4, 6, 7, 9, 11];
buffer = Buffer.alloc(s, scale.size,1, {|b| b.setnMsg(0, scale) });


play({
    var mix;
    mix =
    SinOsc.ar(
        (
            DegreeToKey.kr(
                buffer.bufnum,
                Gendy5.kr(minfreq:1, maxfreq:8, ampscale:0.1, durscale:0.1, initCPs:3, mul:7.5, add:7.5),
                12,
                1,
                60
            )
            + LFNoise1.kr([3,3], 0.04)
        ).midicps,
        0).cubed * 0.1
    + RLPFD.ar(LFPulse.ar([48,55].midicps, 0.15),
        Gendy4.kr(2, 2, 1, 1, 0.1, 0.2, 0.1, 0.1, 2, mul:10, add:72).midicps, 0.6, 0.2);
    CombN.ar(mix, 0.31, 0.31, 2, 0.2, mix)
})
)


(
SynthDef(\sinfb, {
	arg freq = 440, atk = 0.01, sus = 0, rel = 1, fb = 0, amp = 0.3, out = 0, pan=0;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = Gendy3.ar(3,1,1,0.9,freq,1,1,6);
	sig = sig*env;
	sig = CombN.ar(sig,0.2,0.2,1,1);
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;
);

(
~uno = Pbind(
    \instrument,
    \sinfb,
    \out, 20,
	\root, -12,
	\scale, Scale.spanish,
	\degree, Pseq([[0,2,4,10]],inf),
    \amp, Pexprand(50,100,inf)/127,
	\sus, 0.1,
	\dur, Pseq([0.5,0.5,1],inf)
).play;
)
~uno.stop

(
// efx synthdef- dig the timing on the delay and the pbind. :-P
SynthDef(\pbindefx, { arg out, in, time1=0.25, time2=0.5;
    var audio, efx;
    audio = In.ar([20, 21], 2);
    efx=CombN.ar(audio, 0.5, [time1, time2], 10, 1, audio);
    Out.ar(out, efx);
}).add;

// create efx synth
a = Synth.after(1, \pbindefx);

// if you don't like the beats change to 0.4, 0.24
// a.set(\time1, 0.4, \time2, 0.24);

SynthDef(\acid, { arg out, freq = 1000, gate = 1, pan = 0, cut = 4000, rez = 0.8, amp = 1;
    Out.ar(out,
        Pan2.ar(
            RLPF.ar(
                Pulse.ar(freq, 0.05),
            cut, rez),
        pan) * EnvGen.kr(Env.linen(0.02, 1, 0.3), gate, amp, doneAction: Done.freeSelf);
    )
}).add;
)

(
Pbind(\instrument, \acid, \out, 20, \dur, Pseq([0.25, 0.5, 0.25], inf), \root, [-24, -17],
    \degree, Pseq([0, 3, 5, 7, 9, 11, 5, 1], inf), \pan, Pfunc({1.0.rand2}),
    \cut, Pxrand([1000, 500, 2000, 300], inf), \rez, Pfunc({0.7.rand +0.3}), \amp, 0.12).play;
)



