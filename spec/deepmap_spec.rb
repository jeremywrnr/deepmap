# deepmap rspec unit testing

require "spec_helper"

describe DeepMap do
  before :each do
    @pair = { 1 => 4, 2 => [5, 6], 3 => { 4 => [1, 2, { 5 => 10 }] } }
    @pairout = { 2 => 5, 3 => [6, 7], 4 => { 5 => [2, 3, { 6 => 11 }] } }
    @dpair, @dpairout = [@pair, @pair], [@pairout, @pairout]

    @key = { 1 => 4, 2 => [5, 6], 3 => { 4 => [1, 2, { 5 => 10 }] } }
    @keyout = { 2 => 4, 3 => [5, 6], 4 => { 5 => [1, 2, { 6 => 10 }] } }
    @dkey, @dkeyout = [@key, @key], [@keyout, @keyout]

    @val = { :a => 4, :b => [5, 6], :c => { :d => [1, 2, { :e => 10 }] } }
    @valout = { :a => 5, :b => [6, 7], :c => { :d => [2, 3, { :e => 11 }] } }
    @dval, @dvalout = [@val, @val], [@valout, @valout]
  end


  describe "#deep_map" do
    context "when called on hash" do
      it "returns self with no args" do
        expect(@pair.deep_map).to eq @pair
      end

      it "maps block to each pair" do
        expect(@pair.deep_map {|x| x.to_i + 1 }).to eq @pairout
      end
    end

    context "when called on array" do
      it "returns self with no args" do
        expect(@dpair.deep_map).to eq @dpair
      end

      it "maps block to each pair" do
        expect(@dpair.deep_map {|x| x.to_i + 1 }).to eq @dpairout
      end
    end
  end


  describe "#key_map" do
    context "when called on hash" do
      it "returns self with no args" do
        expect(@key.key_map).to eq @key
      end

      it "maps block to each key" do
        expect(@key.key_map {|x| x.to_i + 1 }).to eq @keyout
      end
    end

    context "when called on array" do
      it "returns self with no args" do
        expect(@dkey.key_map).to eq @dkey
      end

      it "maps block to each key" do
        #expect(@dkey.key_map {|x| x.to_i + 1 }).to eq @dkeyout
      end
    end
  end


  describe "#val_map" do
    context "when called on hash" do
      it "returns self with no args" do
        expect(@val.val_map).to eq @val
      end

      it "maps block to each val" do
        expect(@val.val_map {|x| x + 1 }).to eq @valout
      end
    end

    context "when called on array" do
      it "returns self with no args" do
        expect(@dval.val_map).to eq @dval
      end

      it "maps block to each val" do
        expect(@dval.val_map {|x| x + 1 }).to eq @dvalout
      end
    end
  end
end

