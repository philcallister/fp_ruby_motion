##
# Maintain a Dictionary of 4-gram segments as words
# are added to it.  Once words have been added, the
# 4-gram segments can then be retrieved.
#
# For this example, I was asked to retrieve segments that
# are unique and contain ONLY 1 MATCHING WORD. However, since
# I'm storing all matching words for a given segment, it's
# possible to retrieve all matches.  While this consumes more
# memory, it offers greater flexibility for future enhancements.
#
# Also, I've provide a mechanism to ONLY return the segments
# without their corresponding words. Again, for flexibility,
# I thougt it would be nice to provide only the segments if needed. 
#
# Examples
#
#   add_word("arrows")
#   add_words("carrots", "give", "me")
#   unique_segments
#   # => Array ["carr", "give", "rots", "rows", "rrot", "rrow"]
class Dictionary < Hash

  ##
  # Add a new word to the Dictionary.  The word is transformed into
  # 4-gram segments, and the original word is stored within the segment.
  #
  # word - The word to add
  #
  # Examples
  #
  #   add_word("arrows")
  #   # => Dictionary
  #
  # Returns self, the Dictionary.
  def add_word(word)
    ngrams = word.ngrams 4
    ngrams.each { |ng| self[ng] = self[ng].nil? ? [word] : self[ng] << word }
    self
  end

  ##
  # Add new words to the Dictionary.  The words are transformed into 4-gram segments.
  #
  # words - The words to add
  #
  # Examples
  #
  #   add_words("arrows", "carrots", "give", "me")
  #   # => Dictionary
  #
  # Returns nothing.
  def add_words(*words)
    words.each { |w| add_word w }
  end

  ##
  # Return the unique, sorted 4-gram segments from added words.
  #
  # with_words - false: only return the segments / true: return segments AND words. Default is false
  #
  # ignore_case - false: don't ignore case when sorting / true: ignore case when sorting. Default is false
  #
  # Examples
  #
  #   unique_segments
  #   # => Array
  #
  #   unique_segments true
  #   # => Array[Array]
  #
  #   unique_segments(true, true)
  #   # => Array[Array]
  #
  # Returns sorted Array of 4-gram segments and potentially the original words
  def unique_segments(with_words=false, ignore_case=false)
    select_block = Proc.new { |k,v| v.length == 1 }
    return segments_ignore_case(with_words, &select_block) if ignore_case
    return segments(with_words, &select_block)
  end
    

  private

  def segments_ignore_case(with_words, &select_block)
    return (self.select &select_block).sort_by { |item| item.first.downcase } if with_words
    return (self.select &select_block).keys.sort_by { |item| item.downcase }
  end

  def segments(with_words, &select_block)
    return (self.select &select_block).sort if with_words
    return (self.select &select_block).keys.sort
  end

end
