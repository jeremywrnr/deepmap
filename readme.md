deepmap
=======


[![Gem Version](https://badge.fury.io/rb/deepmap.svg)](https://badge.fury.io/rb/deepmap)
[![Build Status](https://travis-ci.org/jeremywrnr/deepmap.svg?branch=master)](https://travis-ci.org/jeremywrnr/deepmap)
[![MIT](https://img.shields.io/npm/l/alt.svg?style=flat)](http://jeremywrnr.com/mit-license)


## setup

    [sudo] gem install deepmap

## about

Ruby gem that adds three methods to the Hash and Array classes. Overview:

- `#deep_map` - apply block to each key and value in object
- `#key_map` - apply block to each key in object
- `#val_map` - apply block to each value in object

These may be useful when you want to apply a function to each value (or key or
pair) of a complex nested object (such as the result of parsing a YAML or JSON
file), which can have hashes or arrays as subfields. The function currently
needs to be passed in as a block (see usage).


## usage

```ruby
irb(main):001:0> require 'deepmap'
=> true
irb(main):002:0> test = { 1 => 4, 2 => [5, 6], 3 => { 4 => [1, 2, { 5 => 10 }] } }
=> {1=>4, 2=>[5, 6], 3=>{4=>[1, 2, {5=>10}]}}
irb(main):003:0> test.deep_map {|i| i.to_i * 2 }
=> {2=>8, 4=>[10, 12], 6=>{8=>[2, 4, {10=>20}]}}
irb(main):004:0> test.key_map {|i| i.to_i * 2 }
=> {2=>4, 4=>[5, 6], 6=>{8=>[1, 2, {10=>10}]}}
irb(main):005:0> test.val_map {|i| i.to_i * 2 }
=> {1=>8, 2=>[10, 12], 3=>{4=>[2, 4, {5=>20}]}}
```

Once you `require 'deepmap'`, you can call any of the three provided functions
on any (existing or new!) hash or array, as demonstrated above.


## development / testing

First, clone this repo:

    git clone https://github.com/jeremywrnr/deepmap.git

To build from source, first install the project dependencies. This project
uses `bundler`, the standard ruby gem management system. If you don't have it,
try running `gem install bundler`. Once that is done:

    bundle install

Now, we should be able to build the gem locally. This will build the local
deepmap gem and link it in your path, so you can playing around with `deepmap`.

    rake build

This uses `rspec` and `rake` to run a suite of unit tests. To run the suite:

    rake


## todo

- support better object mapping, like `#deep_map(:method) => #deep_map {|x| x.method }`

