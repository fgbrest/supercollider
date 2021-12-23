// ESCALA
~scale01.source = Scale.spanish;
Scale.directory

// RAíZ
~root01.source = (Pseq([4,-1,-4],inf));
~root01.source = -12;
~root01.source = 0;
~root01.source = (Pxrand([0,12,0,-12,6,-1,1],inf));

// GRADO
~degree01.source = Pseq([1,4,6],inf);
~degree01.source = Pseq([2,6,7],inf);
~degree01.source = Pseq([Pseq([1,4,6],4),Pseq([2,6,7],4)],inf); // dos arpegios
~degree01.source = Pseq((1..8),inf)+Prand([-12,2,10,0],inf);
~degree01.source = 0;
~degree01.source = 7;
~degree01.source = Pseq([0,0,4,5,4,5,4,0.1],inf);
~degree01.source = Prand([0,1,2,3,4,5,6,7,8,9,10,11,12],inf);
~degree01.source = Pfsm([#[0,1,2],Pseq([1,2,3],1),#[1,2],Pseq([4,5,6],1),#[1,2],Pseq([7,8,9],1),#[0,2],#[1,1]]);
~degree01.source = Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf);
~degree01.source = Pseq([Pbrown(0, 24, 1, 16).clump(6).do { |x| x.postln }], inf);
~degree01.source = Pseq([Ppoisson(10,100).clump(1).do { |x| x.postln }], inf);

// RITMO
~dur01.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~dur01.source = (Pseq([1,2,1,0.5],inf));
~dur01.source = 1/8;
~dur01.source = 1/4;
~dur01.source = 1/5;
~dur01.source = Pseq([1/8,1/8,1/8,1/8,1/4,1/4,1/2],inf);
~dur01.source = (Pseries(0.1,0.1,inf)); // rallentando
~dur01.source = (Pbrown(0.01,0.5,0.125,inf)); // erratic
~dur01.source = Pfsm([#[0,1,2],Pseq([1/8],8),#[1,2],Pseq([1/4],4),#[1,2],Pseq([1/5],5),#[0,2],#[1,1]]);

// DINÁMICA
~amp01.source = Pexprand(50,90,inf)/127;
~amp01.source = Pseq([25,30,65,25,50],inf)/127;
~amp01.source = 0.6;

// CONTROLES
~uno.play;
~uno.stop;