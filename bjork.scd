Pbjorklund
Pbjorklund2

(
Pbind(
	\degree, Pseq([1,3,5],inf),
	\dur,Pbjorklund2(29,28,inf),
	\amp, 0.6,
).play;
)
s.boot

l = Pbjorklund2(Pseq([3,8,2,5,9,10,14,3,5,5,4,9,14],inf),16)/4;

(
~ring1 = Pbind(
	\root,l,
	\degree,Pseq([-2,2,l],inf),
	\octave,l+3,
	\dur,0.2/l,
	\amp,0.5,
).play;
)