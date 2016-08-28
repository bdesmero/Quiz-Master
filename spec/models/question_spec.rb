require "rails_helper"

RSpec.describe Question, :type => :model do
  it "Content should present" do
    question = Question.new
    question.content = ''
    question.answer = '5'
    question.valid?
    expect(question.errors[:content]).to include("can't be blank")
  end

  it "Answer should present" do
    question = Question.new
    question.content = 'How many vowels are there in the English Alphabet?'
    question.answer = ''
    question.valid?
    expect(question.errors[:answer]).to include("can't be blank")
  end

  it "Make sure Question saved to Database" do
    question = Question.new
    question.content = 'How many vowels are there in the English Alphabet?'
    question.answer = '5'
    question.save!
    expect(Question.count).to eq 1
  end
end