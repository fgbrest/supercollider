s.boot

b = Buffer.read(s, Platform.resourceDir +/+ "sounds/criolla01.wav");
c = Buffer.read(s, Platform.resourceDir +/+ "sounds/harmonica01.wav");
d = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara01.wav");
e = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara02.wav");
f = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara03.wav");
g = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara03.wav");
h = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara04.wav");
i = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara05.wav");
j = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara06.wav");
k = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara07.wav");
l = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara08.wav");
m = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara09.wav");
n = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara10.wav");
o = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara11.wav");
p = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara12.wav");
q = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara13.wav");
r = Buffer.read(s, Platform.resourceDir +/+ "sounds/citara14.wav");
t = Buffer.read(s, Platform.resourceDir +/+ "sounds/tecla07.wav");


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
~uno = Pbind(
    \instrument, \bplay,
	\buf, ~buf,
	\rate, ~rate,
	\dur,~dur,
	\pos, ~pos,
	\rel, ~rel,
	\amp, ~amp
).play;
)
(
~buf = PatternProxy(Pseq([b,b,c,c,b],inf));
~rate = PatternProxy(1);
~dur = PatternProxy(1);
~pos = PatternProxy(0);
~rel = PatternProxy(1);
~amp = PatternProxy(1);
)

~buf.source = Pseq([b,c,c,c,b],inf);
~buf.source = Pseq([p,[d,q,h],r,[f,m,i],j],inf);
~buf.source = Pseq([f],inf);
~buf.source = Prand([o,[l,m,f],g,[e,m,k],j,r,r,r,[r,r,r,r],r],inf);
~buf.source = b;~pos.source = 0.94;
~buf.source = c;~pos.source = 0;
~rate.source = Pseq([1,0.5,2,0.5,3,0.5,9,4,2,3,3,3,3,1,0.1],inf);
~rate.source = Pseq([[0.1,1.1,1.9]],inf);
~dur.source = Prand([1/8,1/4,1/8,1/16,1/16,1/8,1/4,1/2,1/4,1/4],inf)/4;
~dur.source = 1;~rel.source = 3;
~pos.source = Pxrand([0,0.5,0,1,1.1,2.5,0.4],inf);
~pos.source = 0;
~amp.source = 1;



~uno.play;
~uno.stop;


// eston asi me gusta para empezar un tema

~degree.source = Pseq([[0.1,1.1,2.1]],inf);
~dur.source = 1;
~rq.source = Pseq([0,0.5,0,1],inf);
~rel.source = 1;

// esto tb

~buf.source = c;
~degree.source = Pseq([1,0.5,2,0.5,3,0.5],inf);
~dur.source = 1;~rel.source = 2;
~rq.source = Pseq([0,0.5,0,1],inf);
~amp.source = 1;
