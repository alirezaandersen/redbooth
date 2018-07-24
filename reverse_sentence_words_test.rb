require 'json'
require 'rspec/autorun'
require_relative 'reverse_sentence_words'

describe "ReverseSentence" do
  context "base cases" do
    it "I like wearing a hat" do
      expect(ReverseSentence.reverse_sentence_words("I like wearing a hat")).to eq("I ekil gniraew a tah")
    end

    it "reversing a sentence" do
      expect(ReverseSentence.reverse_sentence_words("reversing a sentence")).to eq('gnisrever a ecnetnes')
    end
  end
end
