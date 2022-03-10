class DiaryEntry

  def initialize(title, contents)
    @title = title
    @contents = contents
    @starting_point = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(" ") + 1
  end

  def reading_time(wpm)
    fail "Error! Words per minute must be greater than zero!" unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    @max_words = wpm * minutes
    @ending_point = @starting_point + @max_words

    @contents_array = @contents.split(" ")
    @starting_point
    @ending_point
    reading_chunk = @contents_array[@starting_point, @ending_point]
    @starting_point = @ending_point

    return reading_chunk.join(" ")

  end

end