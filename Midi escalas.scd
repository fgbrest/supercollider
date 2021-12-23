MIDIClient.init;
MIDIClient.destinations;
m = MIDIOut.new (1);

(
~dr = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
    \midinote, Pwrand([36,42,59,61,54],[0.1,0.8,0.08,0.2],inf),
    \amp, Pexprand(5,100,inf)/127,
    \sustain, 0.2,
    \dur, 0.15
).play;
)

Scale.directory

ProxySpace


// Escalas vieja!

p=Pbjorklund2(3,8);
Quarks.gui

Pbjorklund2(3,8);

Quarks.install("~Users\Economicas\Desktop\Bjorklund-master\Bjorklund-master");

a=Scale.chromatic
Scale.directory

// normalización para ritmos (x..y)=1 y acordes simbolizados
((1..5).normalizeSum)*2
\Em

(
~dp = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 2,
// grados de la escala en lugar de midinotes
    \octave, 0,
	\degree,Pxrand([\Em,\Am7,\Bm7].chordProg,inf),
    \scale, a,
	\amp, Pexprand(5,100,inf)/127,
	\sustain, 0.2,
	\dur, Pbjorklund2(Pwhite(1,8),Pwhite(1,16))/4,
).play;
)
~dp.play; // P I A N O
~dp.stop;


// L-system

(
var rhythm = Array.fill(rrand(4,10),{rrand(1,10)}).normalizeSum * rrand(1,4);
l = Prewrite(1,
    (
        //equal to 2 duration units/beats
        1: #[0.25,0.5,0.5,0.25,2],
        0.25: #[1],
        2: rhythm
),15);



~dp = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 2,
// grados de la escala en lugar de midinotes
	\root, Pxrand([-20,-10,-5],inf),
	\octave,Pwrand([4,[3,4],[2,3,4]],[0.9,0.08,0.02],inf),
	\degree, Pxrand([0,1,[2,4,6],3,4,[5,7,9],6,7],inf),
    \scale, a,
	\amp, Pexprand(5,100,inf)/127,
	\sustain, l*2,
	\dur, l*3,
).play;
)




allNotesOff(1);
~dp.play; // P I A N O
~dp.stop;

~dr.play; // D R U M S
~dr.stop;
