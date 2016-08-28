require "rails_helper"

describe "Converter Word to Number" do

  it "Check if number string still converted properly" do
    number_string = "0"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 0

    number_string = "5"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 5

    number_string = "10"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 10

    number_string = "17"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 17

    number_string = "30"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 30

    number_string = "35"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 35

    number_string = "99"
    result = Converter::WordToNumber.analyze!(number_string)
    expect(result).to eq 99
  end

  it "Check if number word < 10 still converted properly" do
    number_word = "zero"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 0

    number_word = "seven"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 7
  end

  it "Check if number word 10..19 still converted properly" do
    number_word = "ten"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 10

    number_word = "twelve"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 12

    number_word = "fivteen"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 15
  end

  it "Check if number word 20..99 still converted properly" do
    number_word = "twenty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 20

    number_word = "thirty five"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 35

    number_word = "fifty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 50

    number_word = "ninety nine"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 99
  end

  it "Check if number word typo / wrong should return false" do
    number_word = "sven"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "elven"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "forty to"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "sventy one"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false
  end

  it "Check if number word not structured / abstract word should return false" do
    number_word = "one two"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "three fifty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "seven eleven"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "eleven three"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "twelve forty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "twelve eleven"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "seventy ten"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "ninety thirty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false
  end

  it "Check if number word > 99 should return false (atm)" do
    number_word = "one hundred"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "two hundred fifty"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false

    number_word = "one thousand five hundred seventy six"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq false
  end

  it "Edge Cases check if number word have extra space still work properly" do
    number_word = "  one  "
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 1

    number_word = " thirty  five"
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 35

    number_word = "eleven  "
    result = Converter::WordToNumber.analyze!(number_word)
    expect(result).to eq 11
  end

end