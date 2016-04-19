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

These are useful when you want to apply a function to each value (or key or
pair) of a complex nested object (such as the result of parsing a YAML or JSON
file), which can have hashes or arrays as subfields. The function currently
needs to be passed in as a block (see usage).


## usage

```
require "deepmap"


```


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

