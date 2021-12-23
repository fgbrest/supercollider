(
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
		\dur,1/4,
		\amp, 0.5
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
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
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
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
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
	\control, Pxrand([12,20,20,20,100,100,70,70,70,50,100,127],inf),
	\dur, 1/2
	);
).play;
)