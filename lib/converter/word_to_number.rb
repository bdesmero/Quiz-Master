module Converter::WordToNumber

  ONE_DIGIT_NUMBER = {
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
  }.freeze

  TWO_DIGIT_NUMBER = {
    ten: 10,
    eleven: 11,
    twelve: 12,
    thirteen: 13,
    fourteen: 14,
    fivteen: 15,
    sixteen: 16,
    seventeen: 17,
    eighteen: 18,
    nineteen: 19
  }.freeze

  TWO_DIGIT_NUMBER_COMPLEX = {
    twenty: 20,
    thirty: 30,
    forty: 40,
    fifty: 50,
    sixty: 60,
    seventy: 70,
    eighty: 80,
    ninety: 90
  }.freeze

  NUMBER_EXCEPTION = ["zero", "0"].freeze

  def self.analyze!(word)
    word.downcase!
    number = word.to_i
    if number != 0 || NUMBER_EXCEPTION.include?(word)
      number
    else
      convert!(word)
    end
  end

  private

  def self.convert!(word)
    split_words = word.split(' ')
    number_result = []
    split_words.each {|word| number_result << convert_scope_by(word)}
    if number_result.present?
      calculate_numbers_with_rules(number_result)
    else
      false
    end
  end

  def self.convert_scope_by(word)
    word_sym = word.to_sym
    one_digit_number_scope = ONE_DIGIT_NUMBER.keys
    two_digit_number_scope = TWO_DIGIT_NUMBER.keys
    two_digit_number_complex_scope = TWO_DIGIT_NUMBER_COMPLEX.keys
    if one_digit_number_scope.include? word_sym
      ONE_DIGIT_NUMBER[word_sym]
    elsif two_digit_number_scope.include? word_sym
      TWO_DIGIT_NUMBER[word_sym]
    elsif two_digit_number_complex_scope.include? word_sym
      TWO_DIGIT_NUMBER_COMPLEX[word_sym]
    else
      nil
    end
  end

  def self.calculate_numbers_with_rules(number_result)
    # Check if number result don't have nil value
    if number_result.all?
      rules_valid?(number_result) ? number_result.sum : false
    else
      false
    end
  end

  def self.rules_valid?(number_result)
    if (number_result.count > 2 || number_result[0] < (number_result[1] || 0))
      false
    elsif (number_result[0].between?(1,9) && number_result[1].present?)
      false
    elsif (number_result[0].between?(10,19) && number_result[1].present?)
      false
    elsif (number_result[0].between?(20,99) && number_result[1].present?)
      (number_result[1] < 10) ? true : false
    else
      true
    end
  end
end
