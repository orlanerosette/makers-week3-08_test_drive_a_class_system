require 'diary_entry'

RSpec.describe DiaryEntry do

  it "constructs" do
    entry = DiaryEntry.new("my_title", "entry_1")
    expect(entry.contents).to eq "entry_1"
  end

  describe "#count_words" do
    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("my_title", "")
      expect(entry.count_words).to eq 0
    end
    it "returns one if contents is one word" do
      entry = DiaryEntry.new("my_title", "one")
      expect(entry.count_words).to eq 1
    end
    it "counts the words in the contents" do
      entry = DiaryEntry.new("my_title", "one two three four")
      expect(entry.count_words).to eq 4
    end
  end

  describe "#reading_time" do
    it "fails if the wpm is zero" do
      entry = DiaryEntry.new("my_title", "")
      expect {entry.reading_time(0)}.to raise_error "Error! Words per minute must be greater than zero!"
    end
    it "returns zero if contents is empty" do
      entry = DiaryEntry.new("my_title", "")
      expect(entry.reading_time(2)).to eq 0
    end
    it "returns one if contents is one word" do
      entry = DiaryEntry.new("my_title", "one")
      expect(entry.reading_time(5)).to eq 1
    end
    it "returns a reading time for the contents" do
      entry = DiaryEntry.new("my_title", "one two three four")
      entry_2 = DiaryEntry.new("title_2", "one two three four five")
      expect(entry.reading_time(2)).to eq 2
      expect(entry_2.reading_time(2)).to eq 3
    end
  end

  describe "#reading_chunk" do
    it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
      diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
      diary.count_words
      expect(diary.reading_chunk(2, 1)).to eq "one two"
    end


    # WHY DOES THIS ONE BREAK DOWN
    # it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
    #   diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
    #   diary.count_words
    #   diary.reading_chunk(2, 1)
    #   expect(diary.reading_chunk(2, 1)).to eq "three four"
    # end

    it "given a time of 2 wpm and 1 minute to read,it returns the last word" do
      diary = DiaryEntry.new("Wednesday 9th March 2022", "one two three four five")
      diary.count_words
      diary.reading_chunk(2, 1)
      diary.reading_chunk(2, 1)
      expect(diary.reading_chunk(2, 1)).to eq "five"
    end

  end 

end