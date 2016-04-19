# Creating deep_map, key_map, val_map methods in DeepMap.

module DeepMap
  def deep_map
    return self if !block_given?
    recurse {|x| yield x}
  end

  def key_map
    return self if !block_given?
    recurse("key") {|x| yield x}
  end

  def val_map
    return self if !block_given?
    recurse("val") {|x| yield x}
  end

  private
  # Main recursive method. With the block passed in, keep recursing through the
  # object, applying the block to either each key or value (or both) depending
  # on the first caller of this method. This is the value stored in 't' type. If
  # the key is a hash, than collect the results of calling it recursively. If
  # the key is an array, then map the recursive method over each item in the
  # array. If it is niether a hash or an array, then apply the block to that
  # item, and return the result.
  def recurse(t="both", h=self)
    if h.is_a?(Hash)

      Hash[ h.collect {|k, v|
        case t # type
        when "both", "key"
          [ yield(k), recurse(t, v) {|x| yield x } ]
        when "val"
          [ k, recurse(t, v) {|x| yield x} ]
        end
      }]

    elsif h.is_a?(Array)

      h.map {|v| recurse(t, v) {|x| yield(x) } }

    else # apply to value

      t == "key" ? h : yield(h)

    end
  end
end


# Adding deep_map, key_map, val_map methods to Hash and Array classes.

class Hash
  include DeepMap
end

class Array
  include DeepMap
end

