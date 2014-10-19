s.boot;
s.scope;

(
   var last = Dictionary.new;
   last["first"] = 1;
~tldcb = {|msg|
	var tt,xx,yy,ww,hh,dunno,pitch,prop1,prop2;
	xx = msg[2];
	yy = msg[3];
	ww = msg[4];
	hh = msg[5];
	if(last["first"] == 1, {
		last["x"] = xx;
		last["y"] = yy;
		last["w"] = ww;
		last["h"] = hh;
		last["first"] = 0;
	});
	prop1 = 0.95;
	prop2 = 1.0 - prop1;
	xx.postln;
	last["x"] = (last["x"]*prop1) + (prop2*xx);
	last["y"] = (last["y"]*prop1) + (prop2*yy);
	last["w"] = (last["w"]*prop1) + (prop2*ww);
	last["h"] = (last["h"]*prop1) + (prop2*hh);
	last["x"].postln;
	pitch = (((xx - last["x"]).abs) + ((yy - last["y"]).abs)) * 40.0;
	pitch.postln;
	if(pitch > 20.0, {
		(\freq: pitch).play;

	});
};
)

~tld = {|msg, time, addr, recvPort| 
	~tldcb.(msg);
	//msg.postln;
};

~collision = OSCFunc.newMatching(~tld, '/tld');
