s.boot
m = MIDIOut.new (1);
(
		Pdef(
	\uno,
	Pbind(
			\instrument, \bpfbuf,
		\dur, 1/8,
			\atk, Pexprand(0.0,4.5),
			\rel, Pexprand(1/8,2),
		\buf, Prand(b[\oh]++b[\stab]++b[\syn],inf),
		\rate, Prand([rrand(0.1,1),1,rrand(1.1,2),1,5,9],inf),
		\spos, Pseq([0.0, 0.9],inf),
			\amp, 0.9,
		\freq, Pxrand([20.midicps,30.midicps, 40.midicps, 50.midicps, 60.midicps],inf),
			\rq, 0.09,
		\bpfmix, Pwhite(0.10,0.75,inf),
			\group, ~mainGrp,
			\out, ~bus[\reverb]
);
).play;


		Pdef(
	\dos,
	Pbind(
			\instrument, \bpfbuf,
		\dur, 1,
			\atk, Pexprand(0.0,4.5),
			\rel, Pexprand(1/8,2),
		\buf, Prand(b[\obj],inf),
		\rate, Prand([rrand(0.1,1),1,rrand(1.1,2),1,5,9],inf),
		\spos, Pseq([0.0, 0.9],inf),
			\amp, 0.3,
		\freq, Pxrand([20.midicps,30.midicps, 40.midicps, 50.midicps, 60.midicps],inf),
			\rq, 0.09,
		\bpfmix, Pwhite(0.10,0.75,inf),
			\group, ~mainGrp,
			\out, ~bus[\reverb]
);
).stop;
)
Pdef(
	\drums,
	Pbind(
		\type, \midi,
		\midicmd, \noteOn,
		\midiout, m,
		\chan, 0,
		\scale, Scale.chromatic,
		\root, Pseq([
			Pseq([-12],32),
			Pseq([0],16),
			Pseq([12],16)
		],inf),
		\degree,Pseq([0,17,2,[0,17]],inf),
		\dur, 1/4,
		\amp, 1
	);
	).play;


Pdef(
	\keys,
	Pbind(
		\type, \midi,
		\midicmd, \noteOn,
		\midiout, m,
		\chan, 1,
		\scale, Scale.spanish,
		\root, -12,
		\degree,0,
		\sus,2,
		\amp, 0.5
	);
	).play;

Pdef(
	\control,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,43,
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
	\dur, 1/8
	);
).play;

Pdef(
	\control02,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,44,
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
	\dur, 1/4
	);
).play;

Pdef(
	\control03,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 1,
    \ctlNum,45,
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
	\dur, 1/2
	);
).play;
)





(
~legato = 1;
c = MIDIFunc.cc({ |value, num, chan, src|
    ~legato = value.linlin(0, 127, 0.1, 2.5)
}, 1);    // 1 means modwheel
)
(
~legatos = 2;
c = MIDIFunc.cc({ |value, num, chan, src|
    ~legatos = value.linlin(0, 127, 0.1, 2.5)
}, 2);    // 1 means modwheel
)
(
~legatoss = 3;
c = MIDIFunc.cc({ |value, num, chan, src|
    ~legatoss = value.linlin(0, 127, 0.1, 2.5)
}, 3);    // 1 means modwheel
)


(
		Pdef(
	\drone, Pbind(
			\instrument, \bpfsaw,
		\dur, 1/8,
		\freq, Pfunc { ~legatos } *10,
			\detune, Pwhite(0.03,0.2),
			\rqmin, 0.18,
			\rqmax, Pfunc { ~legatoss },
			\cfmin, 50,
			\cfmax, Pfunc { ~legato }*1000   ,
			\atk, 0,
			\sus, 0.1,
			\rel, 1/4,
			\amp, 1,
			\group, ~mainGrp,
			\out, ~bus[\reverb]
	);
	).stop;
)