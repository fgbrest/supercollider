s.boot
MIDIClient.init;
m = MIDIOut.new (1);
MIDIIn.connectAll;

MIDIdef.cc(\print, {arg val, num, chan, src; [src,chan, num, val].postln});

MIDIFunc.cc(


(
~legato = PatternProxy(1);
c = MIDIFunc.cc({ |value, num, chan, src|
    ~legato.source = value.linlin(100, 1000, 0.1, 2.5)
}, 8);
)

(
p = Pbind(
    \degree, Pwhite(-7, 12, inf),
    \dur, Pwrand([0.25, Pn(0.125, 2)], #[0.8, 0.2], inf),
    \legato, ~legato
).play;
)

p.stop;
c.remove;


(
var    pattern = Pbind(
        \degree, Pseries(7, Pwhite(1, 3, inf) * Prand(#[-1, 1], inf), inf).fold(0, 14)
            + Prand(#[[0, -2, -4], [0, -3, -5], [0, -2, -5], [0, -1, -4]], inf),
        \dur, Pwrand(#[1, 0.5], #[0.8, 0.2], inf),
	\legato, ~legato
    ),
    player;

~noteOnFunc = MIDIFunc.cc({
    if(player.isNil or: { player.isPlaying.not }) {
        player = pattern.play;
    } {
        player.stop;
    };
// 60 limits this MIDIFunc to listen to middle-C only
// but it will pick up that note from any port, any channel
}, 82);
)

// when done
~noteOnFunc.free;

SynthDef.new(\sinpk, { arg freq = 440;
	Out.ar(0, Pan2.ar(SinOsc.ar(freq, 0, 0.1) + PinkNoise.ar(0.01)));
}).add;

h = Synth(\sinpk, [\freq, 440]);
h.set("freq", (69).midicps);
MIDIdef.noteOn(\changefreq, {arg val, num, chan, src;
	h.set("freq", (num).midicps);
});

h.stop

