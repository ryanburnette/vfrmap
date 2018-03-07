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
```

```ruby
Vfrmap.new([location],[options])
```

- `location` Coordinates that can be parsed by
  [Geo::Coord](https://github.com/zverok/geo_coord) or a 3-letter IATA airport
  code.
- `options` See [DEFAULTS](#) constant.
