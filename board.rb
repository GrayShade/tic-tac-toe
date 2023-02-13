class Board
  attr_accessor :size, :board_hash, :check_board, :empty_squares_count

  def initialize(size)
    self.board_hash = Hash.new(' ')
    self.size = size
    self.empty_squares_count = (size * size)
  end

  def create_board
    puts "Board size is: #{size}x#{size}"
    alphas = ('a'..'z').to_a
    size.times do |ele| # creating a hash of given size
      row_name = alphas[ele]
      # Assigning array of given size & default value to each row
      board_hash[row_name] = Array.new(size, ' ')
    end
    # puts board_hash
  end

  def update_board(plyr_move, plyr_icon)
    plyr_move = plyr_move.split('')
    board_hash.each do |row_name, arr|
      # if plyr_move == row_name
      arr.each_with_index do |_ele, idx|
        # check position for player icon to be placed correctly:
        next unless row_name == plyr_move[0] && idx.to_s == plyr_move[1]

        board_hash[row_name][idx] = plyr_icon
        # cant just use empty_squares_count as it will call getter method &
        # thus can't assign value to a getter:
        self.empty_squares_count -= 1
      end
    end
  end

  def display_board
    board_hash.each do |row_name, arr|
      arr.each_with_index do |ele, idx|
        row_ele = idx == arr.length - 1 ? ele : "#{ele} | "
        print row_ele
      end
      puts ''
      # don't print line if its last row:
      puts '---------' unless board_hash.keys.last == row_name
    end
  end

  def announce_round_result(calculation_result)
    puts calculation_result
  end
end
