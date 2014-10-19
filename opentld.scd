s.boot;
s.scope;


~tldcb = {|msg|};

~tld = {|msg, time, addr, recvPort| 
	~tldcb.(msg);
	msg.postln;
};

~collision = OSCFunc.newMatching(~tld, '/tld');
