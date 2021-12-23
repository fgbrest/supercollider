s.boot;
MIDIClient.init;
MIDIClient.destinations;
m = MIDIOut.new (1);
(
d = Dictionary.new;
d.add(\a ->
	PathName("C:/Users/pc salon/Desktop/Clairwil/Sounds/air").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
d.add(\e ->
	PathName("C:/Users/pc salon/Desktop/Clairwil/Sounds/earth").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
d.add(\w ->
	PathName("C:/Users/pc salon/Desktop/Clairwil/Sounds/water").entries.collect({
		arg sf;
		Buffer.read(s, sf.fullPath);
	});
);
)
(
SynthDef(\bplaym,
	{arg out = 0, buf = 0, rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15;
		var sig,env ;
		sig = Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2),pan);
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,sig);
}).add;
)

// P E R F O R M E R

(
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bplaym,
		\dur, Pseq([1/8], inf),
		\buf, Pseq(
			[
				Prand(d[\a],1),
				Prand(d[\a]++d[\e]++d[\w], 7),
				Prand(d[\a],1),
				Prand(d[\a]++d[\e]++d[\w], 7),
			], inf
		),
		\rate, Pexprand(0.8,1.25,inf),
		\amp, Pseq([1, Pexprand(0.05, 0.5, 7)],inf),
		\rel, 1/2
	);
	).stop;

Pdef(
	\keys,
	Pbind(
		\type, \midi,
		\midicmd, \noteOn,
		\midiout, m,
		\chan, 1,
		\scale, Scale.chromatic,
		\root, -12,
		\degree,Pseq([0, 7, 12, 18, 12, 0, 7, 12, 18], inf),
		\dur, Pseq([3/8,1/4]++(1/8!3)++(1/4!4),inf),
		\amp, Pseq([1, Pexprand(0.50, 0.70, 7)],inf)
	);
	).stop;

Pdef(
	\control,
	Pbind(
    \type, \midi,
    \midicmd, \control,
    \midiout, m,
    \chan, 0,
    \ctlNum,1,
	\control, Prand([1,20,20,20,100,100,70,70,70,50,100,127],inf),
	\dur, 1/8
	);
).stop;
)


