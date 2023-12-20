require 'spec_helper'
require_relative '../../substrings.rb'

RSpec.describe 'Substring Exercises' do
  describe 'substring exercise' do
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    
    it 'returns hash with 2 substrings' do
      result = substrings("below", dictionary)
      expected = { 'below' => 1, "low" => 1 }
      expect(expected).to eq(result)
    end
    
    it 'returns hash with many substrings' do
      result = substrings("Howdy partner, sit down! How's it going?", dictionary)
      expected = { 
        "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, 
        "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
      expect(expected).to eq(result)
    end
  end
end
