s.boot
MIDIClient.init;
m = MIDIOut.new (3);

TempoClock.default.tempo = 70/60;

(
~volcab = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
	\scale, ~scale,
    \root, ~root,
	\degree, ~degree,
    \dur,~dur,
	\amp, ~amp,
).play;
)

// ARMAR
~scale = PatternProxy(Scale.whole);
~root = PatternProxy(0);
~degree = PatternProxy (0);
~dur = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp = PatternProxy(Pexprand(50,90,inf)/127);

// ESCALA
~scale.source = Scale.spanish;
Scale.directory

// RAíZ
~root.source = (Pseq([4,-1,-4],inf));
~root.source = -12;
~root.source = 0;
~root.source = (Pxrand([0,12,0,-12,6,-1,1],inf));

// GRADO
~degree.source = Pseq([1,4,6],inf);
~degree.source = Pseq([2,6,7],inf);
~degree.source = Pseq([Pseq([1,4,6],4),Pseq([2,6,7],4)],inf); // dos arpegios
~degree.source = Pseq((1..8),inf)+Prand([-12,2,10,0],inf);
~degree.source = 0;
~degree.source = 7;
~degree.source = Pseq([0,0,4,5,4,5,4,0.1],inf);
~degree.source = Prand([0,1,2,3,4,5,6,7,8,9,10,11,12],inf);
~degree.source = Pfsm([#[0,1,2],Pseq([1,2,3],1),#[1,2],Pseq([4,5,6],1),#[1,2],Pseq([7,8,9],1),#[0,2],#[1,1]]);
~degree.source = Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf);
~degree.source = Pseq([Pbrown(0, 24, 1, 16).clump(6).do { |x| x.postln }], inf);
~degree.source = Pseq([Ppoisson(10,100).clump(4).do { |x| x.postln }], inf);

// RITMO
~dur.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~dur.source = (Pseq([1,2,1,0.5],inf));
~dur.source = 1/8;
~dur.source = 1/4;
~dur.source = 1/5;
~dur.source = Pseq([1/8,1/8,1/8,1/8,1/4,1/4,1/2],inf);
~dur.source = (Pseries(0.1,0.1,inf)); // rallentando
~dur.source = (Pbrown(0.01,0.5,0.125,inf)); // erratic
~dur.source = Pfsm([#[0,1,2],Pseq([1/8],8),#[1,2],Pseq([1/4],4),#[1,2],Pseq([1/5],5),#[0,2],#[1,1]]);

// DINÁMICA
~amp.source = Pexprand(50,90,inf)/127;
~amp.source = Pseq([25,30,65,25,50],inf)/127;
~amp.source = 0.6;

// CONTROLES
~volcab.play;
~volcab.stop;