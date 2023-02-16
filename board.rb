class Board
  attr_accessor :size, :board_hash, :check_board, :empty_squares_count, :prefilled_hash

  def initialize(size)
    self.board_hash = Hash.new(' ')
    self.size = size
    self.empty_squares_count = (size * size)
  end

  def create_boards
    puts "Board size is: #{size}x#{size}"
    puts '------------------------------------------------------------'
    puts '| How To Play:                                             |'
    puts '| Use alphabets for horizontal rows & numbers for vertical |'
    puts '| column indicies.i.e, Possible moves are displayed below. |'
    puts '------------------------------------------------------------'
    alphas = ('a'..'z').to_a
    size.times do |ele| # creating a hash of given size
      row_name = alphas[ele]
      # Assigning array of given size & default value to each row
      board_hash[row_name] = Array.new(size, ' ')
    end
    prefill_hash
    display_possible_moves
  end

  def prefill_hash
    # After all tries, prefilled_hash was still referencing to the same
    #   object. So Had to use deep_copy custom method below to cater that issue
    self.prefilled_hash = deep_copy(board_hash)
    prefilled_hash.each do |row_name, arr|
      arr.each_with_index do |_, idx|
        prefilled_hash[row_name][idx] = "#{row_name}#{idx}"
      end
    end
    # prefilled_hash
  end

  def deep_copy(obj)
    # Below line is used to make a deep copy of passed object:
    Marshal.load(Marshal.dump(obj))
  end

  def display_possible_moves
    prefilled_hash.each do |row_name, arr|
      arr.each_with_index do |icon, idx|
        player_icon = idx == arr.length - 1 ? icon : "#{icon} | "
        print player_icon
      end
      puts ''
      # don't print line if its last row:
      puts '--------------' unless board_hash.keys.last == row_name
      puts if board_hash.keys.last == row_name
    end
  end

  def position_already_filled?(_plyr_icon, plyr_move)
    plyr_move = plyr_move.split('')
    board_hash.each do |row_name, arr|
      arr.each_with_index do |_ele, idx|
        # check position for player icon to be checked:
        next unless row_name == plyr_move[0] && idx.to_s == plyr_move[1]

        next if board_hash[row_name][idx] == ' '

        puts 'Position already filled !!!'
        puts
        return false
      end
    end
    true
  end

  def update_board(plyr_icon, plyr_move)
    plyr_move = plyr_move.split('')
    board_hash.each do |row_name, arr|
      # if plyr_move == row_name
      arr.each_with_index do |_ele, idx|
        # check position for player icon to be placed correctly:
        next unless row_name == plyr_move[0] && idx.to_s == plyr_move[1]

        board_hash[row_name][idx] = plyr_icon
        self.empty_squares_count -= 1
      end
    end
  end

  def display_board
    puts
    board_hash.each do |row_name, arr|
      arr.each_with_index do |ele, idx|
        player_icon = idx == arr.length - 1 ? ele : "#{ele} | "
        print player_icon
      end
      puts ''
      # don't print line if its last row:
      puts '---------' unless board_hash.keys.last == row_name
      puts if board_hash.keys.last == row_name
    end
  end

  def announce_round_result(calculation_result)
    puts calculation_result
    puts
  end
end
