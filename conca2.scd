s.boot

b = Buffer.read(s, Platform.resourceDir +/+ "sounds/selector-strato.wav");
c = Buffer.read(s, Platform.resourceDir +/+ "sounds/tos.wav");
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

(
SynthDef(\bplay,
	{arg out = 0, buf = 0, rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15;
		var sig,env ;
		sig = Mix.ar(PlayBuf.ar(2,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2));
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,Pan2.ar(sig,pan));
}).add;
)
(
~uno = Pbind(
    \instrument, \bplay,
	\buf, ~buf1,
	\rate, ~rate1,
	\dur,~dur1,
	\pos, ~pos1,
	\rel, ~rel1,
	\amp, ~amp1
).play;

~dos = Pbind(
    \instrument, \bplay,
	\buf, ~buf2,
	\rate, ~rate2,
	\dur,~dur2,
	\pos, ~pos2,
	\rel, ~rel2,
	\amp, ~amp2
).play;
)
)
(
~buf1 = PatternProxy(b);
~rate1 = PatternProxy(1);
~dur1 = PatternProxy(1);
~pos1 = PatternProxy(0);
~rel1 = PatternProxy(1);
~amp1 = PatternProxy(1);
// dos
~buf2 = PatternProxy(c);
~rate2 = PatternProxy(1);
~dur2 = PatternProxy(1);
~pos2 = PatternProxy(0);
~rel2 = PatternProxy(1);
~amp2 = PatternProxy(1);
)

~buf1.source = Pseq([b,c,c,c,b],inf);
~buf1.source = Pseq([p,[d,q,h],r,[f,m,i],j],inf);
~buf1.source = Pseq([f],inf);
~buf1.source = Prand([o,[l,m,f],g,[e,m,k],j,r,r,r,[r,r,r,r],r],inf);
~buf1.source = b;~pos.source = 0.94;
~buf1.source = c;~pos.source = 0;
~rate1.source = Pseq([1,0.5,2,0.5,3,0.5,9,4,2,3,3,3,3,1,0.1],inf);
~rate1.source = Pseq([[0.1,1.1,1.9]],inf);
~dur1.source = Prand([1/8,1/4,1/8,1/16,1/16,1/8,1/4,1/2,1/4,1/4],inf)/4;
~dur1.source = 1;~rel.source = 3;
~pos1.source = Pxrand([0,0.5,0,1,1.1,2.5,0.4],inf);
~pos1.source = 0;
~amp1.source = 1;



~uno.play;
~uno.stop;


// DOS

(

)

~buf2.source = b;
~buf2.source = Pseq([p,[d,q,h],r,[f,m,i],j],inf);
~buf2.source = Pseq([f],inf);
~buf2.source = Prand([o,[l,m,f],g,[e,m,k],j,r,r,r,[r,r,r,r],r],inf);
~buf2.source = b;~pos.source = 0.94;
~buf2.source = c;~pos.source = 0;
~rate2.source = Pseq([1,0.5,2,0.5,3,0.5,9,4,2,3,3,3,3,1,0.1],inf);
~rate2.source = Pseq([[0.1,1.1,1.9]],inf);
~dur2.source = Prand([1/8,1/4,1/8,1/16,1/16,1/8,1/4,1/2,1/4,1/4],inf)/4;
~dur2.source = 1;~rel.source = 3;
~pos2.source = Pxrand([0,0.5,0,1,1.1,2.5,0.4],inf);
~pos2.source = 0;
~amp2.source = 1;



~dos.play;
~dos.stop;
