# sagittarius

An attempt at implementing a date and time library for pony as suggested in this [ponyc issue](https://github.com/ponylang/ponyc/issues/1902#issuecomment-302221252).

## Inspirations
- https://docs.rs/chrono/0.3.1/chrono/
- https://github.com/rust-lang/rust-wiki-backup/blob/master/Lib-datetime.md
- http://www.joda.org/joda-time/

## Name explained
Time -> chrono -> [Chronos](https://en.wikipedia.org/wiki/Chronos) ->  as a man turning the Zodiac Wheel -> Saggitarius = half man half pony

## Status

[![Build Status](https://travis-ci.org/slayful/sagittarius.svg?branch=master)](https://travis-ci.org/slayful/sagittarius)

WORK IN PROGRESS

## Installation

* Install [pony-stable](https://github.com/ponylang/pony-stable)
* Update your `bundle.json`

```json
{
  "type": "github",
  "repo": "slayful/sagittarius"
}
```

* `stable fetch` to fetch your dependencies
* `use "sagittarius"` to include this package
* `stable env ponyc` to compile your application
