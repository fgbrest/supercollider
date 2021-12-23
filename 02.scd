// GRADO
~note02.source = Pseq([36,38,38],inf);~dur02.source = Pseq([1,0.5,0.5],inf); b.free;
~note02.source = 36;~dur02.source = 4;
~note02.source = Pseq([36,[36,42],43,49],inf);~dur02.source = Pseq([1/2,1/4,1/8,1/8],inf);
~note02.source = Pfsm([#[0,1,2],Pseq([36,[36,42],43,49],1),#[1,2],Pseq([36,[35,43],42,46],1),#[1,2],Pseq([33,[36,42],43,50],1),#[0,2],#[1,1]]);

// RITMO
~dur02.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~dur02.source = Pseq([1/2,1/4,1/8,1/8],inf);
~dur02.source = Pfsm([#[0,1,2],Pseq([1/2,1/4,1/8,1/8],1),#[1,2],Pseq([1/8,1/8,1/4],1),#[1,2],Pseq([1/16,1/16,1/8,1/2],1),#[0,2],#[1,1]]);


// DINÁMICA
~amp02.source = 90/127;

// CONTROLES
~drums.play;
~drums.stop;