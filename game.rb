require_relative 'player'

class Game 
  
  def initialize(player_one,player_two)
    @player_one = player_one
    @player_two = player_two
  end


  def generate_question()
    @number_one = rand(1..20)
    @number_two = rand(1..20)
    @operator = [:+, :-, :*, :/].sample
    @answer = @number_one.send(@operator, @number_two)
    puts "What is the answer to: #{@number_one} #{@operator} #{@number_two}?"
  end
end



# -----

