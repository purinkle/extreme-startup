module AnswerFactory
  def self.create(query)
    question = query[/^\w{8}: (.*)$/, 1]
    answers = [AdditionAnswer, MaximumAnswer]

    answers.find { |answer| answer.match? question }.new(question)
  end

  class AdditionAnswer
    def self.match?(question)
      question.match(/^what is \d+ plus \d+$/)
    end

    def initialize(question)
      @question = question
    end

    def to_s
      numbers = @question.scan(/\d+/).map(&:to_i)
      numbers.sum.to_s
    end
  end

  class MaximumAnswer
    def self.match?(question)
      question.match?(/^which of the following numbers is the largest: (\d+)(,\s*\d+)*$/)
    end

    def initialize(question)
      @question = question
    end

    def to_s
      numbers = @question.scan(/\d+/).map(&:to_i)
      numbers.max.to_s
    end
  end
end
