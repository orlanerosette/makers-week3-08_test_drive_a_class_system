class Diary
  def initialize
    @entries = []
    @all_contents = []
    @starting_point = 0
    @ending_point = 0
  end

  def add(entry)
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    @entries.select do |entry|
      @all_contents << entry.contents
    end
    @word_count = @all_contents.join(" ").split(" ").length
    return @word_count
  end

  def reading_time(wpm)
    return (@word_count / wpm.to_f).ceil 
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # binding.irb
    @max_words = wpm * minutes
    @ending_point = @starting_point + @max_words

    @contents_array = @all_contents.join(" ").split(" ")
    # binding.irb
    reading_chunk = @contents_array[@starting_point, @ending_point]
    # binding.irb
    @starting_point = @ending_point

    return reading_chunk.join(" ")

  end

end

