s.boot
MIDIClient.init;
m = MIDIOut.new (1);

TempoClock.default.tempo = 70/60;
(
~drums = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 0,
	\midinote, ~note02,
    \dur,~dur02,
	\amp, ~amp02,
).play;
)
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
~note02 = PatternProxy (36);
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

~uno.play; ~dos.play;
~uno.stop; ~dos.stop; 