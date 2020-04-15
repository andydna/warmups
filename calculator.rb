require 'pry'

class Calculator
  MESSAGES = { zero: '0', one:   '1', two:   '2', three:   '3', four: '4',
               five: '5', six:   '6', seven: '7', eight:   '8', nine: '9',
               plus: '+', minus: '-', times: '*', divide:  '/' }

  MESSAGES.each do |message, token|
    define_method(message) do
      @tokens << token
      @tokens.count == 3 ? solve : self
    end
  end

  def initialize
    @tokens = []
  end

  def solve
    binding.pry
    eval(@tokens.join(' '))
  end
end

RSpec.describe Calculator do
  context 'can add numbers' do
    it 'Calculator.new.two.plus.five == 7' do
      calculated = Calculator.new.two.plus.five

      expect(calculated).to eq(7)
    end
  end

  context 'can subtract numbers' do
    it 'Calculator.new.nine.minus.five == 4' do
      calculated = Calculator.new.nine.minus.five

      expect(calculated).to eq(4)
    end
  end

  context 'can multiply numbers' do
    it 'Calculator.new.three.times.seven == 21' do
      calculated = Calculator.new.three.times.seven

      expect(calculated).to eq(21)
    end
  end

  context 'can divide numbers' do
    it 'Calculator.new.nine.divide.three == 3' do
      calculated = Calculator.new.nine.divide.three

      expect(calculated).to eq(3)
    end
  end
end
