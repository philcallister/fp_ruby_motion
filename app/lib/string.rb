##
# Monkey patched String class to include n-gram support
class String

  ##
  # Return n-grams for the String.
  #
  # n - The size of the n-grams
  #
  # rx - The Regex used to split the String
  #
  # Examples
  #
  #   'arrows'.ngrams(4)
  #   # => Array ['arro', 'rrow', 'rows']
  #
  # Returns an Array of n-grams.
  def ngrams(n=2, rx=//)
    ngrams = []
    tokens = self.split(rx)
    max = tokens.length - n
    0.upto(max) do |i|
      segment = tokens[i..i+n-1].join
      ngrams << segment unless /\d|'/.match(segment) # disgard any segments that inlude
                                                     # integers or apostrophes
    end
    ngrams
  end

end