class Player
  attr_accessor :name
  attr_reader :life, :score

  def initialize(name)
    @name = name
    @life = 3
    @score = 0
  end
end

puts "Player one, please provide your name:"
@player_one_name = gets.chomp
puts "Player two, please provide your name:"
@player_two_name = gets.chomp

