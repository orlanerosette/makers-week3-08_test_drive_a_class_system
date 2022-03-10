
# in diary_integration spec

# it "returns a chunk of reading that can be completed in the time given in minutes" do
    #   diary = Diary.new
    #   entry_1 = DiaryEntry.new("my_title_1", "one")
    #   entry_2 = DiaryEntry.new("my_title_2", "two three")
    #   entry_3 = DiaryEntry.new("my_title_3", "four five six")
    #   entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
    #   diary.add(entry_1)
    #   diary.add(entry_2)
    #   diary.add(entry_3)
    #   diary.add(entry_4)
    #   diary.count_words
    #   expect(diary.find_best_entry_for_reading_time(1, 2)).to eq "one two"
    # end

    # it "returns a chunk of reading that can be completed in the time given in minutes" do
    #     diary = Diary.new
    #     entry_1 = DiaryEntry.new("my_title_1", "one")
    #     entry_2 = DiaryEntry.new("my_title_2", "two three")
    #     entry_3 = DiaryEntry.new("my_title_3", "four five six")
    #     entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
    #     diary.add(entry_1)
    #     diary.add(entry_2)
    #     diary.add(entry_3)
    #     diary.add(entry_4)
    #     diary.count_words
    #     expect(diary.find_best_entry_for_reading_time(2, 2)).to eq "one two three four"
    # end

    # it "returns a chunk of reading that can be completed in the time given in minutes" do
    #   diary = Diary.new
    #   entry_1 = DiaryEntry.new("my_title_1", "one")
    #   entry_2 = DiaryEntry.new("my_title_2", "two three")
    #   entry_3 = DiaryEntry.new("my_title_3", "four five six")
    #   entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
    #   diary.add(entry_1)
    #   diary.add(entry_2)
    #   diary.add(entry_3)
    #   diary.add(entry_4)
    #   diary.count_words
    #   expect(diary.find_best_entry_for_reading_time(1, 3)).to eq "one two three"
    #     # expect(diary.find_best_entry_for_reading_time(1, 2)).to eq "four five" - why does this not work?
    # end

# in diary.rb

# def find_best_entry_for_reading_time(wpm, minutes)
#   # binding.irb
#   @max_words = wpm * minutes
#   @ending_point = @starting_point + @max_words

#   @contents_array = @all_contents.join(" ").split(" ")
#   # binding.irb
#   reading_chunk = @contents_array[@starting_point, @ending_point]
#   # binding.irb
#   @starting_point = @ending_point

#   return reading_chunk.join(" ")

# end

