a = Pseries(start: 0, step: 1, length: inf).asStream;
a.nextN(10);

p = Pseries(0, 1, 10);
p.next; // always returns the Pseries, not actual numbers
q = p.asStream;
q.next; // calling this repeatedly gets the desired increasing integers


r = p.asStream;
r.next; // starts from zero, even though q already gave out some numbers
q.next; // resumes where q left off, with no effect from getting values from r
[q.next, r.next] // and so on...
Bear these points

a = Pgeom(1.0, 1.1, inf);
b = a.asStream;
b.next;

Pslide(#[1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).asStream.all;
Pslide(#[1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).clump(3).asStream.all;


a=Scale.partch_u6
Scale.directory

(
Pbind(
	\scale, a,
	\degree, Pseq([[0,2,7],1,4], inf),
	\dur, 0.5,
	\sustain, Pseq(#[0.1, 0.5], inf),
).play;
)

s.boot

(
Pbind(
\scale, a,
\degree, Pshuf([0, 1, 2, 4, 5], inf),
\dur, 0.25
).play;
)

(
Pbind(
	\scale, a,
	\degree, Ptuple([Pseries(6, -0.1, 8),Pseq([5, 3, 3, 3, 4, 4, 2, 2], 1),Pseq([4, 4, 4, 2, 2, 0, 0, -3], 1)	], inf),
	\dur, Pseq([0.5,0.5,1, 0.2, 0.2, 0.25, 0.25],inf)
).play;
)

(
p = Pbind(
\degree, Ptuple([Pseries(6, -0.1, 8),Pseq([5, 3, 3, 3, 4, 4, 2, 2], 1),Pseq([4, 4, 4, 2, 2, 0, 0, -3], 1)	], inf),
	\dur, Pexprand(0.1,1,inf)
).asStream;
)

p.next(Event.new);

Event.default;

(
p = Pbind(\degree, Pwhite(0, 7, inf), \dur, 0.25, \legato, 1).play;)
p.stop;
(p = Pmono(\default, \scale, a, \degree, Pseq([1,3,7], inf), \dur, Pseq([0.25,0.25,0.5],inf)).play;)
p.stop;

