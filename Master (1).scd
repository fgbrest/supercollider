s.boot
MIDIClient.init;
m = MIDIOut.new (2);

TempoClock.default.tempo = 70/60;

(
~uno = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
	\scale, ~scale01,
    \root, ~root01,
	\degree, ~degree01,
    \dur,~dur01,
	\amp, ~amp01,
).play;

~dos = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 1,
	\scale, ~scale02,
    \root, ~root02,
	\degree, ~degree02,
    \dur,~dur02,
	\amp, ~amp02,
).play;

~tres = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 2,
	\scale, ~scale03,
    \root, ~root03,
	\degree, ~degree03,
    \dur,~dur03,
	\amp, ~amp03,
).play;

~cuatro = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 3,
	\scale, ~scale03,
    \root, ~root03,
	\degree, ~degree03,
    \dur,~dur03,
	\amp, ~amp03,
).play;
)

// ARMAR
(
~scale01 = PatternProxy(Scale.whole);
~root01 = PatternProxy(0);
~degree01 = PatternProxy (0);
~dur01 = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp01 = PatternProxy(Pexprand(50,90,inf)/127);
~scale02 = PatternProxy(Scale.whole);
~root02 = PatternProxy(0);
~degree02 = PatternProxy (0);
~dur02 = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp02 = PatternProxy(Pexprand(50,90,inf)/127);
~scale03 = PatternProxy(Scale.whole);
~root03 = PatternProxy(0);
~degree03 = PatternProxy (0);
~dur03 = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp03 = PatternProxy(Pexprand(50,90,inf)/127);
~scale04 = PatternProxy(Scale.whole);
~root04 = PatternProxy(0);
~degree04 = PatternProxy (0);
~dur04 = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~amp04 = PatternProxy(Pexprand(50,90,inf)/127);
)

~uno.play; ~dos.play; ~tres.play; ~cuatro.play;
~uno.stop; ~dos.stop; ~tres.stop; ~cuatro.stop;