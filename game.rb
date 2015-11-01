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
    @correct_answer = @number_one.send(@operator, @number_two)
    puts "What is the answer to: #{@number_one} #{@operator} #{@number_two}?"
  end

  def get_answer
    @player_answer = gets.chomp
  end

  def verify_answer(current_player)
    puts "#{current_player.name}, let us check if your answer is correct."
    if @player_answer == @correct_answer
      puts "#{current_player.name}, you were correct!".colorize(:green)
      current_player.score += 1
    else
      puts "#{current_player.name}, oh no! You've lost a life!".colorize(:red)
      current_player.life -= 1
      current_player.score
    end
    puts "#{current_player.name}, you have #{current_player.life} lives left and your score is #{current_player.score}"
  end

end

# -----
