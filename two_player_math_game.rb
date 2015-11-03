require 'colorize'

@player_one_lives = 3
@player_two_lives = 3
@user_answer = " "
@number_one = 0
@number_two = 0
@sum = 0


puts "Player one please provide your name:"
@player_one = gets.chomp
puts "Player two please provide your name:"
@player_two = gets.chomp

@current_player = @player_one

@player_one_score = 0
@player_two_score = 0

def generate_question(player)
  @number_one = rand(1..20)
  @number_two = rand(1..20)
  @sum = @number_one + @number_two
  puts "#{player}, please find the sum of the two following numbers: #{@number_one} and #{@number_two}"
end

def prompt_player_for_answer
  puts "What is the answer to the problem?"
  @user_answer = gets.chomp 
end

def verify_answer
  if @sum == @user_answer.to_i  
    puts "#{@current_player}, you were correct!".colorize(:green)
  else
    puts "#{@current_player}, oh no! You've lost a life!".colorize(:red)
    player_life(@current_player)
  end
end

def player_life(player)
  if player == @player_one
    @player_one_lives -=1
    puts "#{player}, you have #{@player_one_lives} lives left"
  end
  if player == @player_t
    @player_two_lives -=1
    puts "#{player}, you have #{@player_two_lives} lives left"
  end
end

def score(player)
  if player == @player_one
    if @sum == @user_answer.to_i  
      @player_one_score += 1
      puts "#{player}, your score is: #{@player_one_score}"
    end
  end
  if player == @player_two
    if @sum == @user_answer.to_i  
      puts @player_two_score += 1
      puts "#{player}, your score is: #{@player_two_score}"
    end
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
  while @player_one_lives > 0 && @player_two_lives > 0 do
    generate_question(@current_player)
    prompt_player_for_answer
    verify_answer
    score(@current_player)
    switch_player
  end
  if @player_one_lives == 0 || @player_two_lives == 0
    puts "===== END GAME ====="
    puts "The score for #{@player_one} is #{@player_one_score}"
    puts "The score for #{@player_two} is #{@player_two_score}" 
  end
end

#puts generate_question(@current_player,@number_one, @number_two)
#puts prompt_player_for_answer
#puts verify_answer
#puts score(@current_player)
#puts switch_player(@player_one, @player_two)

puts turns
