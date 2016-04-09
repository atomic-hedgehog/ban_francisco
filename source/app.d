import vibe.d;
import ban.annoyances;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["127.0.0.1"];
	listenHTTP(settings, &annoy);

	logInfo("Ready to ban San Fransisco!");


}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Wrong!");
}

void annoy(HTTPServerRequest req, HTTPServerResponse res) {
  import vibe.http.proxy;
  import std.stdio;
  import ban.geo;

  logInfo("Proxying!");
  auto ipAddress = req.peer;

//  ipAddress = "208.80.152.201";
  if(isIpFromCity(ipAddress, "San Francisco")) {
    logInfo("User is scum!");
    annoyUser(80);
  } else {
    logInfo("User is not scum");
  }

  auto prox = reverseProxyRequest("localhost", 8888);
  prox(req, res);
}
