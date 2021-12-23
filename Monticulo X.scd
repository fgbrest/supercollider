s.boot
SynthDef(\bplay,
	{arg out = 0, buf = 0, rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15;
		var sig,env ;
		sig = Mix.ar(PlayBuf.ar(2,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2));
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,Pan2.ar(sig,pan));
}).add;

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=3, ts=1, c1=1, c2=(-1), freq=500, detune=0.02, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, lsf=200, ldb=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),timeScale:ts,doneAction:2);
	sig = Saw.ar(freq*{LFNoise1.kr(0.5,detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(
			LFNoise1.kr(4).exprange(cfhzmin,cfhzmax)
		).exprange(cfmin,cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin,rqmax)}!2
	);
	sig = BLowShelf.ar(sig,lsf,0.5,ldb);
	sig = Balance2.ar(sig[0],sig[1],pan);
	sig = sig*env*amp;
	Out.ar(out,sig);
}).add;
);



Scale.directory




(
Pdef(
	\bsaw,
	Pbind(
		\instrument, \bpfsaw,
		\dur, Pseq([1/8,1/7,1/5,1/9],inf),
		\atk, Pexprand(0.01,0.9),
		\detune, Pexprand(0.1,1.0),
		\rel, Pexprand(0.5,1.2),
		\scale, Scale.ritusen,
		\root, Pseq([-24,-12,0,6,12],inf),
		\degree, Pseq([0,1,2,3,4,5,6,7],inf),
		\amp, Pseq([1,0.1,0.1,0.1],inf),
		\ldb, 20,
		\cfmax, Pseq([500,220,5000,290,300],inf)
);
).play;
)

Pdef(\bsaw).stop;




Pdef(
	\ober,
	Pbind(
		\instrument, \bplay,
		\dur, 1/8,
		\atk, Pexprand(0.0,4.5),
		\rel, Pexprand(1/8,2),
		\buf, Prand(b[\obsaw]++b[\obsawsq]++b[\obsqb],inf),
		\rate, Prand([rrand(0.1,1),1,rrand(1.1,2),1,5,9],inf),
		\spos, Pseq([0.0, 0.9],inf),
		\amp, Pseq([0.5,0.1,0.1,0.1],inf),
		\freq, Pxrand([10.midicps,30.midicps, 40.midicps, 50.midicps, 60.midicps],inf),
		\rq, 0.1
);
).play;

Pdef(
	\ground,
	Pbind(
		\instrument, \bplay,
		\dur, 1/8,
		\atk, 0,
		\rel, 1/5,
		\buf, Prand(b[\groundplate],inf),
		\rate, Prand([rrand(0.1,1),1,rrand(1.1,2),1,5,9],inf),
		\amp, Pseq([1,Pseq([0.5],7)],inf)
);
).play;
)

Pdef(\ober).stop;
Pdef(\ground).stop;
