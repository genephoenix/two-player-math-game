require_relative 'player'

class Game 
  attr_accessor :player_one, :player_two, :current_player, :player_answer

  puts "Player one, please provide your name:"
  @player_one_name = gets.chomp
  puts "Player two, please provide your name:"
  @player_two_name = gets.chomp

  def initialize(player_one,player_two)
    @player_one = Player.new(@player_one_name)
    @player_two = Player.new(@player_two_name)
    @current_player = @player_one
    @player_answer = ""
  end

  def generate_question
    @number_one = rand(1..20)
    @number_two = rand(1..20)
    @operator = [:+, :-, :*, :/].sample
    @correct_answer = @number_one.send(@operator, @number_two)
  end

  def ask_question(current_player)
    puts "#{current_player.name}, what is the answer to: #{@number_one} #{@operator} #{@number_two}?"
    @player_answer = gets.chomp
  end

  def verify_answer(current_player)
    if @player_answer.to_i == @correct_answer
      puts "#{current_player.name}, you were correct!".colorize(:green)
      current_player.score += 1
      puts "Your score is currently #{current_player.score}"
    else
      puts "#{current_player.name}, oh no! You've lost a life!".colorize(:red)
      current_player.life -= 1
      current_player.score
      puts "#{current_player.name}, you have #{current_player.life} lives left and your score is #{current_player.score}"
    end
  end

  def switch_player
  puts "==== SWITCH PLAYER ===="
  if @current_player == @player_one
    @current_player = @player_two
  else
    @current_player = @player_one
  end
end

  def turns
    while @player_one.life > 0 && @player_two.life > 0 do
      generate_question
      ask_question(@current_player)
      verify_answer(@current_player)
      switch_player
    end
    if @player_one.life == 0 || @player_two.life == 0
      puts "===== END GAME ====="
      puts "The score for #{@player_one.name} is #{@player_one.score}"
      puts "The score for #{@player_two.name} is #{@player_two.score}" 
    end
  end
end

# ----
