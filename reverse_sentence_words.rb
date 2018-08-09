# Write a function that takes a string as an argument and returns a
# string such that each space-delimited word in the resulting
# string is the reverse of that in the source string, but the words themselves
# are in the same order as they are in the source string.

# Example:
#   Input: "I  like wearing a hat "
#   Output: "I  ekil gniraew a tah "
#
class ReverseSentence

#without using ruby library
  def self.reverse_sentence_words(string)
    string.split(/\s+/).map{|w|wl=w.length-1;(0..wl).map{|i|w[wl-i]}.join}.join(' ')
  end

#using a ruby library
  def self.reverse_sentence_words(string)
    reversal = string.split(' ').each do |x| x.reverse!
    end
    reversal.join(' ')
  end

end
