MIDIClient.init;
m = MIDIOut.new (2);

(
~piano = Pbind(
	\type, \midi,
    \midicmd, \noteOn,
    \midiout, m,
    \chan, 2,
    \scale, Scale.spanish,
    \root, ~root,
	\degree, ~degree,
    \dur,~dur,
	\amp, ~amp
).play;
)

~piano.play;
~piano.stop;

~root = PatternProxy(Pseq([-4,2],inf));
~root.source = (Pseq([4,-1],inf));

~degree = PatternProxy(Pseq([Pwhite(0, 12, 8).clump(2).do { |x| x.postln }], inf));
~degree.source = Pseq([1,4,6],inf);
~degree.source = Pseq([Pwhite(0, 12, 16).clump(3).do { |x| x.postln }], inf);

~dur = PatternProxy(Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~dur.source = (Pseq([0.5,0.5,1, 0.25, 0.25, 0.25, 0.25],inf));
~dur.source = (Pseq([1,2,1,0.5],inf));

~amp = PatternProxy(Pexprand(50,90,inf)/127);
~amp.source = Pseq([25,30,65,25,50],inf)/127;

Scale.spanish