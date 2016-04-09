module ban.annoyances;

import vibe.d;
import std.stdio;

void annoyUser(int percentChance) {
  import std.random;

  auto roll = uniform(0, 100) + 1;
  if(roll < percentChance) {
    throw new HTTPStatusException(404);
  }
}
