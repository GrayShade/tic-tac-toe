# frozen_string_literal: true

# Player class to input player moves basically
class Player
  attr_accessor :name, :icon, :move

  def initialize; end

  def input_player_name(player_type, p1_name = nil)
    checked_input = false
    while checked_input == false
      print "Name For #{player_type}: "
      self.name = gets.chomp
      checked_input = check_player_name(name, p1_name)
    end
    name
  end

  private def check_player_name(name, p1_name)
    if name.empty?
      puts 'Empty Input!!!'
      puts
      false
    elsif name.length > 20
      puts 'Name Too Long !!! (20 chars limit)'
      puts
      false
    elsif name == p1_name
      puts "Player 1 Already Is #{p1_name} !!!"
      puts
      false
    else
      true
    end
  end

  def input_player_icon
    checked_icon = false
    while checked_icon == false
      print "Choose 'x' Or 'o' For #{name}: "
      self.icon = gets.chomp.downcase
      checked_icon = check_player_icon(icon)
    end
    icon
  end

  private def check_player_icon(icon)
    return true if %w[x o].include?(icon)

    puts 'Wrong Choice!!!'
    puts
    false
  end

  def input_player_move(prefilled_hash = nil)
    checked_move = false
    while checked_move == false
      print "#{name} Turn: "
      self.move = gets.chomp
      checked_move = check_player_move(move, prefilled_hash)
    end
    move
  end

  private def check_player_move(move, prefilled_hash)
    if move.empty?
      puts 'Empty Input !!!'
      puts
      false
    elsif move.length != 2
      puts 'Invalid Move !!!'
      puts
      false
    elsif prefilled_hash.values.none? { |arr| arr.include?(move) }
      puts 'Invalid Move !!!'
      puts
      false
    else
      true
    end
  end

  # Not using below style for access modifier private due to its lack
  #   of readability:
  # private :check_player_name, :check_player_icon, :check_player_move
end
