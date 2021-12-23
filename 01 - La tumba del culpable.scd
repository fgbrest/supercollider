// MIDI
~midinote01.source = Pseq(p,inf);~amp01.source = Pseq(v,inf)/127;


// RITMO
~dur01.source = 2
~dur01.source = Pbjorklund2(Pseq([3,8,2,5,9,10,14,3,5,5,4,9,14],inf),16)/8;


~dur01.source = 1/8;
~dur01.source = 1/10;
~dur01.source = 1/5;
~dur01.source = Pseq([1/8,1/8,1/8,1/8,1/4,1/4,1/2],inf);
~dur01.source = (Pseries(0.1,0.1,inf)); // rallentando
~dur01.source = (Pbrown(0.01,0.5,0.125,inf)); // erratic
~dur01.source = Pfsm([#[0,1,2],Pseq([1/8],8),#[1,2],Pseq([1/4],4),#[1,2],Pseq([1/5],5),#[0,2],#[1,1]]);


// DINÁMICA
~amp01.source = Pexprand(50,90,inf)/127;
~amp01.source = Pseq([25,30,65,25,50],inf)/127;
~amp01.source = Pseq(v,inf)/127;

// CONTROLES
~uno.play;
~uno.stop;


