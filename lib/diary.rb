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
    return @entries.sum(&:count_words)
  end

  def reading_time(wpm)
    fail "Error! Words per minute must be greater than zero!" unless wpm.positive?
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries(wpm, minutes).max_by(&:count_words)
  end

  private 

  def readable_entries(wpm, minutes)
    return @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end
  end

end

