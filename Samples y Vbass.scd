m = MIDIOut.new (1);

(
		Pdef(
	\uno,
	Pbind(
		\instrument, \bpfbuf,
		\dur, 1/8,
		\atk, Pwhite(0.0,1.0,inf),
		\rel, Pexprand(1/8,2),
		\buf, Prand([b[\ins][1].bufnum],inf),
		\rate, Pxrand([0.1,0.5,0.9,1,2],inf),
		\spos, 0,
		\amp, 3,
);
).play;

//		Pdef(
//	\dos,
//	Pbind(
//		\instrument, \bpfbuf,
//		\dur, 1/8,
//		\atk, Pexprand(0.0,4.5),
//		\rel, Pexprand(1/8,2),
//		\buf, Prand(b[\oh]++b[\stab]++b[\syn],inf),
//		\rate, Prand([rrand(0.1,1),1,rrand(1.1,2),1,5,9],inf),
//		\spos, Pseq([0.0, 0.9],inf),
//		\amp, 0.9,
//		\freq, Pxrand([20.midicps,30.midicps, 40.midicps, 50.midicps, 60.midicps],inf),
//		\rq, 0.09,
//		\bpfmix, Pwhite(0.10,0.75,inf),
//		\group, ~mainGrp,
//		\out, ~bus[\reverb]
//);
//).stop;

// v  o  l  c  a    b  a  s  s

Pdef(
	\notes,
	Pbind(
		\type, \midi,
		\midicmd, \noteOn,
		\midiout, m,
		\chan, 1,
		\scale, Scale.spanish,
		\root, -12,
		\degree,Pseq(
			[
				(Pseq([0],16)),
				(Pseq([5],8)),
				(Pseq([7],8))
		], inf),
		\dur,1/4,
		\amp, 0.5
	);
	).play;

Pdef(
	\octave,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,40,
	\control, Pxrand([1,127],inf),
	\dur, 1/8
	);
).play;

Pdef(
	\lforate,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,41,
	\control, Pwhite(1,127,inf),
	\dur, 1/16
	);
).play;

Pdef(
	\lfoint,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,42,
	\control, Pwhite(1,127,inf),
	\dur, 1/16
	);
).play;

Pdef(
	\pitch1,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,43,
	\control, Pwhite(1,127,inf),
	\dur, 1/8
	);
).play;

Pdef(
	\pitch2,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,44,
	\control, Pwhite(1,127,inf),
	\dur, 1/4
	);
).play;

Pdef(
	\pitch3,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,45,
	\control, Pwhite(1,127,inf),
	\dur, 1/2
	);
).play;

Pdef(
	\egattack,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,46,
	\control, Pwhite(1,127,inf),
	\dur, 1
	);
).play;

Pdef(
	\egdr,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,47,
	\control, Pwhite(1,127,inf),
	\dur, 1
	);
).play;

Pdef(
	\cutoffegint,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,48,
	\control, Pwhite(1,127,inf),
	\dur, 1
	);
).play;

Pdef(
	\gate,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,49,
	\control, Pwhite(1,127,inf),
	\dur, 1
	);
).play;
)