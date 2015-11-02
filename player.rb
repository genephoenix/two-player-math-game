class Player
  attr_accessor :name, :life, :score
  # attr_reader :life, :score

  def initialize(name)
    @name = name
    @life = 3
    @score = 0
  end
end

#The following code was placed in the game class

# puts "Player one, please provide your name:"
# @player_one_name = gets.chomp
# puts "Player two, please provide your name:"
# @player_two_name = gets.chomp


# player_one = Player.new(@player_one_name)
# player_two = Player.new(@player_two_name)
