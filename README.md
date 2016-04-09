# ban_francisco

A proxy server to annoy users from a specific city.

###Usage
Run the `ban_francisco` executable.

###Current hard-coded settings
The server will listen on `localhost:8080`, and will forward all requests to `localhost:8888`
It will check the incoming client IP address against the [ip-api](http://ip-api.com/) api and extract the city.  If the city matches the target city (curently hard-coded to San Francisco), there is an 80% chance the requester will be presented with an 404 error and stack trace instead of the desired page.

###Coming Soon
* Config file!  No more hacking the code
* Threads!
* New annoyances (long response times, different errors, redirects to bad sites)!
