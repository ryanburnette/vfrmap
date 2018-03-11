# Vfrmap

An implementation of the [VFRMAP API](http://vfrmap.com/map_api.html) in Ruby.

## Installation

```ruby
# Gemfile
gem 'vfrmap'
```

## Usage

```ruby
require 'vfrmap'
Vfrmap.new([location],[options])
```

- `location` Pass in coordinates that can be parsed by
  [Geo::Coord](https://github.com/zverok/geo_coord), a 3-letter IATA airport
  code, or a 4-letter ICAO airport code.
- `options` See [DEFAULTS](#) constant.
