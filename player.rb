class Player
  attr_accessor :name, :life, :score

  def initialize(name)
    @name = name 
    @life = 3
    @score = 0
  end
end
