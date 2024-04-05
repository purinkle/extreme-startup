require "answer_factory"

RSpec.describe AnswerFactory do
  describe ".create" do
    context "when the query is about addition" do
      it "creates an addition answer" do
        answer = AnswerFactory.create("4283db70: what is 7 plus 10")

        expect(answer.to_s).to eq "17"
      end
    end

    context "when the query is about maximum" do
      it "creates a maximum answer" do
        answer = AnswerFactory.create("4283db70: which of the following numbers is the largest: 982, 32, 7, 392")

        expect(answer.to_s).to eq "982"
      end
    end
  end
end
