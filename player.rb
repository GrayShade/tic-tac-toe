class Player
  attr_accessor :name, :icon

  def initialize; end

  def input_name(player_type)
    print "Name for #{player_type}: "
    self.name = gets.chomp
  end

  def input_icon
    print "Choose 'x' or 'o' for #{name}: "
    self.icon = gets.chomp
  end

  def input_move
    print "#{name} turn: "
    input = gets.chomp
  end
end
