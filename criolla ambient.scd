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