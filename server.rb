require "sinatra"
require_relative "lib/answer_factory"

get "/" do
  answer = AnswerFactory.create(params["q"])
  answer.to_s
end
