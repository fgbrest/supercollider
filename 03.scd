// ESCALA
~scale03.source = Scale.spanish;
Scale.directory

// RAíZ
~root03.source = (Pseq([4,-1,-4],inf));


// GRADO
~degree03.source = Pseq([1,4,6],inf);

// RITMO
~dur03.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
;

// DINÁMICA
~amp03.source = Pexprand(50,90,inf)/127;


// CONTROLES
~tres.play;
~tres.stop;