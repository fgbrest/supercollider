s.boot;
MIDIClient.init;
MIDIClient.destinations;
m = MIDIOut.new (1);
(
d = Dictionary.new;
d.add(\a ->
	PathName("C:/Users/pc salon/Desktop/Clairwil/Sounds/flor").entries.collect({
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
		\dur, Prand([1,4,1/2,1/4,1/4,1/5], inf),
		\rate, Prand([1,2,3,4,0.5,0.1,5], inf),
		\pos, Prand([0.9,0.2,0.4,0.6,0,0,1,3], inf),
		\rel, Prand([1,2,3,1,5,-1,10],inf),
		\buf, Pseq([b,c],inf)
	);
	).play;
)


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


