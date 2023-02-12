require_relative 'player'
require_relative 'board'
class Game
  attr_accessor :p1_obj, :p2_obj, :board_obj

  def initialize
    @p1_obj
    @p2_obj
    @board_obj
  end

  def start_game
    create_playr_objcts
    create_board_objct
    board_obj.create_board
    play_round while any_square_empty?
  end

  def any_square_empty?
    # If any square left with default value ' ' representing an empty square:
    board_obj.board_hash.values.any? { |ele| ele.include?(' ') }
  end

  def create_playr_objcts
    puts 'Name for Player 1:'
    p1_name = 'p1'
    puts 'Name for Player 2:'
    p2_name = 'p2'
    puts "Choose 'x' or 'o' for Player 1:"
    p1_icon = 'x'
    p2_icon = p1_icon == 'x' ? 'o' : 'x'
    puts "Player 2 assigned '#{p2_icon}' icon"
    self.p1_obj = Player.new(p1_name, p1_icon)
    self.p2_obj = Player.new(p2_name, p2_icon)
  end

  def create_board_objct
    self.board_obj = Board.new(3)
  end

  def play_round
    make_turn(p1_obj.name, p1_obj.input_move, p1_obj.icon)
    # return if there is no empty square left:
    return unless any_square_empty?

    make_turn(p2_obj.name, p2_obj.input_move, p2_obj.icon)
  end

  def make_turn(player_name, input_move, icon)
    check_turn_legality
    board_obj.update_board(input_move, icon)
    calculation_result = do_calculations(player_name)
    # Default arguments if tried to passed to arguments instead of parameters
    # cause assignment. So be careful in that instance.
    board_obj.display_board(calculation_result)
    end_game unless calculation_result.nil?
  end

  def check_turn_legality; end

  def do_calculations(player_name)
    return "#{player_name} wins" if check_win_horizental
    return "#{player_name} wins" if check_win_vertical
    # check_win_diagonal
    # draw_check
  end

  def check_win_horizental
    board_obj.board_hash.values.any? do |array|
      array.all? { |ele| ele == 'x' || array.all? | ele | ele == 'o' }
    end
  end

  def check_win_vertical
    numeric_hash = {}
    board_obj.board_hash.values.each_with_index { |ele, idx| numeric_hash[idx] = ele }
    # initial value against each icon is 0. This will be incremented on each
    #  vertical match.
    iconic_hash = Hash.new(0)
    # << _ >> argument indicates that it is not being used:
    numeric_hash.each do |_, array|
      array.each_with_index do |icon, idx|
        # if ele is not empty, then store it in i.e,
        # {"x0"=>3, "o1"=>2, "x2"=>1, "o2"=>1} format. Thats because all
        #  vertical elements will have same index in an array:
        iconic_hash["#{icon}#{idx}"] = iconic_hash["#{icon}#{idx}"] + 1 if icon != ' '
      end
    end
    # i.e, if board size is 3 & 3 of same icons reach on board verticaly:
    iconic_hash.values.any? { |val| val == board_obj.size }
  end

  def end_game
    puts 'here in end game'
    exit
  end
end
game = Game.new
game.start_game
