# Yano

[![Build Status](https://travis-ci.org/nikkypx/yano.svg?branch=master)](https://travis-ci.org/nikkypx/yano)

**This is a ruby port of [yn](https://github.com/sindresorhus/yn) by [sindresorhus](https://github.com/sindresorhus)**

> Parse yes/no like values

Useful for validating answers to a CLI prompt.

-

The following case-insensitive values are recognized:

```ruby
'y', 'yes', 'true', true, '1', 1, 'n', 'no', 'false', false, '0', 0
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yano'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yano

## Usage

```ruby
Yano.parse('y');
#=> true

Yano.parse('NO');
#=> false

Yano.parse(true);
#=> true

Yano.parse('abomasum');
#=> nil

# lenient mode will use a key distance-based score
# to leniently accept typos of "yes" and "no"
Yano.parse('mo', lenient: true);
#=> false
```

Unrecognized values return `nil`


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
