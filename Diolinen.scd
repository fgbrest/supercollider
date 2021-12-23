s.boot;

// Orchestra

(
d = Dictionary.new;
d.add(\Be ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Be").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Bo ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Bo").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Cl ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Cl").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Co ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Co").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Cy ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Cy").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Ep ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Ep").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Fx ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Fx").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\HH ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/HH").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Ki ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Ki").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Rd ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Rd").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Ri ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Ri").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Sh ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Sh").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Sn ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Sn").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Ta ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Ta").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\Ti ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/Ti").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
d.add(\To ->
PathName("/Users/pc salon/Desktop/Clairwil/DK/To").entries.collect({
	arg sf;
	Buffer.read(s, sf.fullPath);
	});
);
)

(
SynthDef.new(\bufmplay, {
	arg out = 0, buf=0, rate=1, amp=1, pan=0, pos=0, rel=15;
	var sig, env;
	sig = Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.ir(buf)*rate,1,BufDur.kr(buf)*pos*44100,doneAction:2),pan);
	env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
	sig = sig*env;
	sig = sig*amp;
	Out.ar(out, sig);
}).add;
)

(
SynthDef(\sinfb, {
	arg freq = 440, atk = 0.01, sus = 0, rel = 1, fb = 0, amp = 0.3, out = 0, pan=0;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = SinOscFB.ar(freq,fb,1);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;
)
(
SynthDef(\tri, {
	arg freq = 440, atk = 0.01, sus = 0, rel = 1, iphase = 1, amp = 0.3, out = 0, pan=0;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = LFTri.ar(freq,iphase,1);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;
)
(
SynthDef(\gendy, {
	arg ampdist = 1, durdist = 1, adparam = 1.0, ddparam = 1.0, minfreq = 100, maxfreq = 500, ampscale = 1.0, durscale = 0.1, initCps = 6, atk = 0, sus = 0, rel = 1, amp = 0.5, out = 0, pan = 0;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = Gendy1.ar(ampdist,durdist,adparam,ddparam,minfreq,maxfreq,ampscale,durscale,initCps);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;
)

({Pan2.ar(Gendy1.ar(ampdist:6.rand, durdist:6.rand, adparam:1.0, ddparam:1.0, minfreq:130, maxfreq:500, ampscale:1.0, durscale:0.1, initCPs:6, knum:12))}.play)

(
SynthDef(\cil, {
	arg freq =440, atk = 0, sus = 0, rel = 1, amp = 0.5, out = 0, pan = 0, k = 1, xi = 1, yi = 1;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = StandardN.ar(freq,k,xi,yi,1);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig,pan,amp));
}).add;
)

{ StandardN.ar(440,9,1,-1)}.play(s);

StandardN.ar(freq, k, xi, yi, mul, add)



// Score

(
Pdef(
	\01,
	Pbind(
			\instrument, \tri,
			\scale, Scale.spanish,
			\dur, 1/5,
			\root,-24,
			\degree, Pseq([1,3,5,4,6,8,5,7,9],inf),
			\atk, 0,
			\rel, 0.5,
		\amp, Pseq([0.6,0.5,0.5],inf),
			\iphase, Pwhite(0.5,1,inf),
			\pan, Pseq([-0.75,0.75],inf)
			);
		).play;

Pdef(
	\02,
	Pbind(
			\instrument, \cil,
			\scale, Scale.egyptian,
			\dur, 4,
			\root,0,
			\degree, Pseq([1,3,5,4,6,8,5,7,9],inf),
			\atk, 2.2,
			\rel, 4.2,
		\amp, Pseq([0.4,0.3,0.3],inf),
		\k, Pwhite(0.010,0.910,inf),
		\xi, Pwhite(0.010,0.910,inf),
		\yi, Pwhite(0.010,0.910,inf),
		\pan, Pseq([0.75,-0.75],inf),
		\amp, 0.25
			);
		).play;



)
Pdef(
	\rhythm,
	Pbind(
		\instrument, \bufmplay,
		\dur, 1/8,
		\buf, Pseq([
		[d[\a][2]],
		Pseq([[d[\HH][0]]],3),
		[d[\HH][8]]
		], inf),
		\rate, Prand([1,0.5,1.2,0.7], inf),
		\pos, 0,
		\rel, 1,
		\amp, Pseq([1,0.5,0.5,0.5],inf)
	);
).play;




Pdef(
	\02,
	Pbind(
			\instrument, \tri,
			\scale, Scale.enigmatic,
			\dur, 1,
			\root, -24,
			\degree, Pxrand([1,2,3,4,5],inf),
			\atk, 0,
			\rel, 1.5,
			\amp, 1.5,
			\iphase, 2,
			\pan, 0.75
			);
		).play;

Pdef(
	\03,
	Pbind(
		\instrument, \gendy,
		\ampdist, Pxrand([0,1,2,3,4,5,6],inf),
		\durdist, Pxrand([0,1,2,3,4,5,6],inf),
		\adparam, Pwhite(0.0001,1.0000,inf),
		\ddparam, Pwhite(0.0001,1.0000,inf),
		\minfreq, Pwhite(20,499,inf),
		\maxfreq, Pwhite(500,1500,inf),
		\ampscale, Pwhite(0.0,1.0,inf),
		\durscale, Pwhite(0.0,1.0,inf),
		\initCPs, Prand([5,10,15],inf),
		\atk, 0,
		\dur, 1/8,
		\rel, Pwrand([1/7,1/2],[0.9,0.1],inf),
		\amp, 2
	);
).play;

Pdef(
	\04,
	Pbind(
		\instrument, \cil,
		\dur, 1/8,
		\degree, Pseq([1,10,14,20,22,24,26],inf),
		\root, Pseq([-12,0,12],inf),
		\k, Pwhite(0.01,2.01,inf),
		\xi, 10,
		\yi, 10,
		\pan, 0,
		\rel, 1/8,
		\amp, 0.6
	);
).play;


(
Pdef(
	\05,
	Pbind(
		\instrument, \gendy,
		\ampdist, Pxrand([0,1,2,3,4,5,6],inf),
		\durdist, Pxrand([0,1,2,3,4,5,6],inf),
		\adparam, Pwhite(0.0001,1.0000,inf),
		\ddparam, Pwhite(0.0001,1.0000,inf),
		\minfreq, Pwhite(20,499,inf),
		\maxfreq, Pwhite(500,1500,inf),
		\ampscale, Pwhite(0.0,1.0,inf),
		\durscale, Pwhite(0.0,1.0,inf),
		\initCPs, Prand([5,10,15],inf),
		\atk, 0,
		\dur, 1/4,
		\pan, Pseq([-1,0,1], inf),
		\rel, 1,
		\amp, 0.75
	);
).play;

Pdef(
	\06,
	Pbind(
		\instrument, \cil,
		\dur, 1/4,
		\degree, Pseq([1,10,14,20,22,24,26],inf),
		\root, Pseq([-12,0,12],inf),
		\k, Pwhite(0.01,2.01,inf),
		\xi, 1,
		\yi, 1,
		\pan, Pseq([-1,0,1], inf),
		\rel, 1,
		\amp, 0.25
	);
).play;
)

(
Pdef(
	\07,
	Pbind(
			\instrument, \sinfb,
			\scale, Scale.major,
			\dur, 1/2,
			\root, -12,
			\degree, Pxrand([6,7,8,9,10],inf),
			\atk, 0.45,
			\rel, 0.5,
			\amp, 1,
			\fb, Pwhite(0.50,1.00,inf),
			\pan, -0.75
			);
		).play;

Pdef(
	\08,
	Pbind(
			\instrument, \tri,
			\scale, Scale.major,
			\dur, 1,
			\root, -12,
			\degree, Pxrand([1,7,3,9,5],inf),
			\atk, 0.45,
			\rel, 1,
			\amp, 0.7,
			\iphase, 2,
			\pan, 0.75
			);
		).play;
)




// Player

(
Pdef(\01).stop;
Pdef(\02).stop;
Pdef(\03).stop;
Pdef(\04).stop;
Pdef(\05).stop;
Pdef(\06).stop;
Pdef(\07).stop;
Pdef(\08).stop;
)
(
Pdef(\01).play;
Pdef(\02).play;
Pdef(\03).play;
Pdef(\04).play;
Pdef(\05).play;
Pdef(\06).play;
Pdef(\07).play;
Pdef(\08).play;
)

Synth(\temp__15:3064).stop;
({Pan2.ar(Gendy1.ar(ampdist:2.rand, durdist:6.rand, adparam:1.0, ddparam:1.0, minfreq:200, maxfreq:201, ampscale:1.0, durscale:0.1, initCPs:6, knum:10))}.play)

Scale.directory;

// SCORE

// 1
(
Pdef(\07).play;
Pdef(\08).play;
)
// 2
(
Pdef(\05).play;
Pdef(\07).play;
Pdef(\08).play;
)
//3 pivot
(
Pdef(\04).play;
Pdef(\05).play;
Pdef(\06).stop;
Pdef(\07).play;
Pdef(\08).play;
)
//4 pivot
(
Pdef(\04).play;
Pdef(\05).stop;
Pdef(\06).play;
Pdef(\07).play;
Pdef(\08).play;
)
//5
(
Pdef(\03).play;
Pdef(\04).play;
Pdef(\05).stop;
Pdef(\06).stop;
Pdef(\07).play;
Pdef(\08).play;
)
//6
(
Pdef(\01).play;
Pdef(\02).play;
Pdef(\03).play;
Pdef(\04).play;
Pdef(\05).play;
Pdef(\06).play;
Pdef(\07).stop;
Pdef(\08).stop;
)
//7
(
Pdef(\01).play;
Pdef(\02).play;
Pdef(\03).play;
Pdef(\04).play;
Pdef(\05).stop;
Pdef(\06).stop;
Pdef(\07).stop;
Pdef(\08).stop;
)
//8
(
Pdef(\01).play;
Pdef(\02).stop;
Pdef(\03).play;
Pdef(\04).play;
Pdef(\05).stop;
Pdef(\06).play;
Pdef(\07).stop;
Pdef(\08).play;
)
//9
(
Pdef(\01).play;
Pdef(\02).stop;
Pdef(\03).stop;
Pdef(\04).stop;
Pdef(\05).stop;
Pdef(\06).play;
Pdef(\07).stop;
Pdef(\08).play;
)
//10
(
Pdef(\01).play;
Pdef(\06).stop;
Pdef(\08).play;
)