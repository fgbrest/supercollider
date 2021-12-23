s.boot

(
SynthDef.new(\inn, {
	arg in=0, out=0, amp=1;
	var sig;
	sig = SoundIn.ar(in!2)*amp;
	Out.ar(out,sig);
}).add;

SynthDef.new(\fx, {
	arg in=0, out=0, mix=(-0.5), decay=3, amp=1, delHz=0.25, delMin=0.1, delMax=0.4;
	var sig, delay;
	sig = In.ar(in,2);
	delay=CombL.ar(
		sig,
		0.5,
		SinOsc.kr([delHz,delHz*0.9]).exprange(delMin,delMax),
		decay
	);
	sig=XFade2.ar(sig,delay,mix)*amp;
	Out.ar(out,sig);
}).add;
)

~delBus=Bus.audio(s,2);

(
~micGrp=Group.new;
~delGrp=Group.after(~micGrp);

~micSynth=Synth(\inn,[\in, 0, \out, ~delBus], ~micGrp);
~delSynth=Synth(\fx, [\in, ~delBus, \out, 0], ~delGrp);
)
o = Server.local.options;
o.device="ASIO";

s.boot