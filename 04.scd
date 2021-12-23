// ESCALA
~scale04.source = Scale.spanish;
Scale.directory

// RAíZ
~root04.source = (Pseq([4,-1,-4],inf));

// GRADO
~degree04.source = Pseq([1,4,6],inf);


// RITMO
~dur04.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));


// DINÁMICA
~amp04.source = Pexprand(50,90,inf)/127;

// CONTROLES
~cuatro.play;
~cuatro.stop;