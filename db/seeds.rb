# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Question Seeds
questions = Question.create([
  {
    content: "How many vowels are there in the English Alphabet?",
    answer: "5"
  },
  {
    content: "How many hours in a day?",
    answer: "24"
  },
  {
    content: "How many seconds in a minute?",
    answer: "60"
  },
  {
    content: "How many days in a week?",
    answer: "7"
  },
  {
    content: "How many months in a year?",
    answer: "12"
  },
  {
    content: "What Result of this calculate 5 x 0",
    answer: "0"
  },
  {
    content: "What place human live?",
    answer: "earth"
  },
  {
    content: "What is baby dog called?",
    answer: "puppy"
  },
  {
    content: "How many hours in 3 days?",
    answer: "72"
  }
])