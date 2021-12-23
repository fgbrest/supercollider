m = MIDIOut.new (2);
a = Pseries(start: 0, step: 1, length: inf).asStream;
a.nextN(10);

p = Pseries(0, 1, 10);
p.next; // always returns the Pseries, not actual numbers
q = p.asStream;
q.next; // calling this repeatedly gets the desired increasing integers


r = p.asStream;
r.next; // starts from zero, even though q already gave out some numbers
q.next; // resumes where q left off, with no effect from getting values from r
[q.next, r.next] // and so on...
Bear these points

a = Pgeom(1.0, 1.1, inf);
b = a.asStream;
b.next;

Pslide(#[1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).asStream.all;
Pslide(#[1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).clump(3).asStream.all;


a=Scale.partch_u6
Scale.directory


(
Pbind(
	\scale, a,
	\degree, Pseq([[0,2,7],1,4], inf),
	\dur, 0.5,
	\sustain, Pseq(#[0.1, 0.5], inf),
).play;
)

s.boot

(
q = Pbind(
\scale, a,
\degree, Pshuf([0, 1, 2, 4, 5], inf),
\dur, 0.25
).play;
)

(
~dr = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 2,
    \scale, Scale.spanish,
    \degree, ~degree,
    \dur, Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf),
	\amp, Pexprand(50,90,inf)/127
).play;
)

~dr.play; // D R U M S
~dr.stop;

~degree = PatternProxy(Pseq([Pwhite(0, 12, 8).clump(2).do { |x| x.postln }], inf));
~degree.source = Pseq([1,4,6],inf);
~degree.source = PatternProxy(Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf));
(
~on = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
    \midinote, 36,
    \dur, Pseq([1,1,1,1],inf),
	\amp, 75/127
).play;
)
~dr.play;~on.play;~in.play;
~on.stop;~dr.stop;~in.stop;



(
~in = Pfsm([
    #[0,1,2],
    // 0
    Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 9,
    \scale, Scale.spanish,
    \degree, Pseq([1,3,5],1),
    \amp, Pexprand(50,100,inf)/127,
	\dur, 0.25),
    #[1,2],
    // 1
    Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 10,
    \scale, Scale.spanish,
    \degree, Pseq([2,4,6],1),
    \amp, Pexprand(50,100,inf)/127,
	\dur, 0.5),
    #[1,2],
    // 2
    Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 11,
    \scale, Scale.spanish,
    \degree, Pseq([3,5,7],1),
    \amp, Pexprand(50,100,inf)/127,
	\dur, 0.75),
    #[0,2],
    #[1,1]
]).play;
)





(
q = Pbind(
\degree, Ptuple([Pseries(6, -0.1, 8),Pseq([5, 3, 3, 3, 4, 4, 2, 2], 1),Pseq([4, 4, 4, 2, 2, 0, 0, -3], 1)	], inf),
	\dur, Pexprand(0.1,1,inf)
).asStream;
)

p.next(Event.new);

Event.default;

(
p = Pbind(\degree, Pwhite(0, 7, inf), \dur, 0.25, \legato, 1).play;)
p.stop;
(p = Pmono(\default, \scale, a, \degree, Pseq([1,3,7], inf), \dur, Pseq([0.25,0.25,0.5],inf)).play;)
p.stop;

SynthDef(
	\harpsi, { |outbus = 0, freq = 440, amp = 0.1, gate = 1|
		var out;
		out = EnvGen.ar(Env.adsr, gate, doneAction: 2) * amp *   Pulse.ar(freq, 0.25, 0.45);  Out.ar(outbus, out ! 2); }).add; // see below for more on .memStore
(
p = Pbind(   // Use \harpsi, not \default
	\instrument, \harpsi,
	\scale, b,
	\root, Pseq([-1,0,1],inf),
	\degree, Ptuple([Pseries(0, 1, 8),Pseq([2,4,4,3,1],1)],inf),
	\dur, 0.25 ).play;
)

a = Scale.spanish

p.play;q.play;
p.stop;q.stop;