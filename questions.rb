class Question  

  OPER8R = ["+", "-"].sample

  attr_accessor :question, :correct_answer

  def initialize
    @num_1 = rand(1...20)
    @num_2 = rand(1...20)
    @question = @num_1.to_s + " " + OPER8R + " " + @num_2.to_s
    @correct_answer   = eval(@question)
  end

  def question
    puts "What does #{@question} equal?"
  end 


  def answer
    input = gets.chomp.to_i
  end


end         