require_relative 'player'

class Game 
  attr_accessor :player_one, :player_two, :current_player, :player_answer

  def initialize
    @player_one = Player.new(get_name("one"))
    @player_two = Player.new(get_name("two"))
    @current_player = @player_one
    @player_answer = " "
  end

  def get_name(player)
    puts "Player #{player}, please provide your name:"
    user_name = gets.chomp
    user_name
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
      puts "==== END GAME ===="
      puts "The score for #{@player_one.name} is #{@player_one.score}"
      puts "The score for #{@player_two.name} is #{@player_two.score}"
      puts "===== REPLAY? ====="
      replay? 
    end
  end

  def replay?
    @player_one.life = 3
    @player_two.life = 3
    puts "Players, would you like to keep playing the game?"
    reply = gets.chomp.downcase
    turns if reply == "yes"
    puts "===END GAME ====" if reply == "no"
  end
end

