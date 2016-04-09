module ban.geo;

import vibe.d;

string lookupCity(string ipAddress) {
  auto url = "http://ip-api.com/json/" ~ ipAddress;
  auto city = "";
  requestHTTP(url,
      (scope req) {
        req.method = HTTPMethod.GET;
      },
      (scope res) {
        import std.conv;
        city = to!string(res.readJson()["city"]);
      }
      );
  return city;
}

bool isIpFromCity(string ipAddress, string city){
  auto normalizedCity = "\"" ~ city ~ "\"";
  auto ipCity = lookupCity(ipAddress);

  import std.algorithm.comparison;
  return cmp(normalizedCity, ipCity) == 0;
}
