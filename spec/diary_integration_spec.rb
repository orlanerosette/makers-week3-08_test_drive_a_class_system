require 'diary'
require 'diary_entry'

RSpec.describe "diary_integration" do

  context "when we add a diary entry to the diary" do
    it "returns the entries in a list" do
      diary = Diary.new
      entry = DiaryEntry.new("my_title", "diary_entry")
      diary.add(entry)
      expect(diary.all).to eq [entry]
    end
  end

  context "when we add entries to the diary" do
    it "returns the entries in a list" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "entry_1")
      entry_2 = DiaryEntry.new("my_title_2", "entry_2")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end
  end

  context "with some entries added" do
    it "returns the number of words in all diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "entry_1")
      entry_2 = DiaryEntry.new("my_title_2", "entry_2 example")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 3
    end

    it "returns as an integer, estimated reading time in minutes" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "one")
      entry_2 = DiaryEntry.new("my_title_2", "two three")
      entry_3 = DiaryEntry.new("my_title_3", "four five six")
      entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.count_words
      expect(diary.reading_time(1)).to eq 10
      expect(diary.reading_time(2)).to eq 5
      expect(diary.reading_time(3)).to eq 4
      expect(diary.reading_time(4)).to eq 3
      expect(diary.reading_time(6)).to eq 2
    end

    it "returns a chunk of reading that can be completed in the time given in minutes" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "one")
      entry_2 = DiaryEntry.new("my_title_2", "two three")
      entry_3 = DiaryEntry.new("my_title_3", "four five six")
      entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.count_words
      expect(diary.find_best_entry_for_reading_time(1, 2)).to eq "one two"
    end

    it "returns a chunk of reading that can be completed in the time given in minutes" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "one")
      entry_2 = DiaryEntry.new("my_title_2", "two three")
      entry_3 = DiaryEntry.new("my_title_3", "four five six")
      entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.count_words
      expect(diary.find_best_entry_for_reading_time(2, 2)).to eq "one two three four"
    end

    it "returns a chunk of reading that can be completed in the time given in minutes" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("my_title_1", "one")
      entry_2 = DiaryEntry.new("my_title_2", "two three")
      entry_3 = DiaryEntry.new("my_title_3", "four five six")
      entry_4 = DiaryEntry.new("my_title_4", "seven eight nine ten")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      diary.count_words
      expect(diary.find_best_entry_for_reading_time(1, 3)).to eq "one two three"
      # expect(diary.find_best_entry_for_reading_time(1, 2)).to eq "four five" - why does this not work?
    end


  end


end