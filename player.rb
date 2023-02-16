class Player
  attr_accessor :name, :icon, :move

  def initialize; end

  def input_player_name(player_type, p1_name = nil)
    checked_input = false
    while checked_input == false
      print "Name for #{player_type}: "
      self.name = gets.chomp
      checked_input = check_player_name(name, p1_name)
    end
    name
  end

  def input_player_icon
    checked_icon = false
    while checked_icon == false
      print "Choose 'x' or 'o' for #{name}: "
      self.icon = gets.chomp.downcase
      checked_icon = check_player_icon(icon)
    end
    icon
  end

  def input_player_move(prefilled_hash = nil, board_hash)
    print "#{name} turn: "
    self.move = gets.chomp
    check_player_move(move, prefilled_hash, board_hash)
    move
  end

  def check_player_name(name, p1_name)
    if name.empty?
      puts 'Wrong input!!!'
      false
    elsif name.length > 20
      puts 'Name too long!!! (20 chars limit)'
      false
    elsif name == p1_name
      puts "Player 1 already is #{p1_name} !!!"
      false
    else
      true
    end
  end

  def check_player_icon(icon)
    return true if %w[x o].include?(icon)

    puts 'Wrong Choice!!!'
    false
  end

  def check_player_move(move, prefilled_hash, _board_hash)
    if move.empty?
      puts 'Wrong input!!!'
      false
    elsif move.length != 2
      puts 'Not a valid move !!!'
      false
    elsif prefilled_hash.values.none? { |arr| arr.include?(move) }
      puts 'Not a valid move !!!'
      false
    # elsif

    else
      true
    end
  end

  private :check_player_name, :check_player_icon, :check_player_move
end
