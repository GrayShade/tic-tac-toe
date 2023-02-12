class Player
  attr_accessor :name, :icon

  def initialize(name, icon)
    # below are setters for name & icon using synthetic sugar:
    self.name = name
    self.icon = icon
  end

  def input_move
    puts "#{name} turn:"
    input = gets.chomp
  end
end
