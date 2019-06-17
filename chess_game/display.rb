require "colorize"
require_relative "cursor"


class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    start_loop
  end


  def render
    cursor.board.rows.each_with_index do |row, i1|
      row.each_with_index do |tile, i2|
        if [i1, i2] == cursor.cursor_pos
          if cursor.selected
            print tile.type[0].colorize(tile.color).colorize(:background => :green) if tile != NullPiece
            print "e".colorize(:blue).colorize(:background => :green) if tile == NullPiece
          else
            print tile.type[0].colorize(tile.color).colorize( :background => :red) if tile != NullPiece
            print "e".colorize(:blue).colorize( :background => :red) if tile == NullPiece
          end
        elsif tile == NullPiece
          print "e".colorize(:blue)
        else
          print tile.type[0].colorize(tile.color)
        end
      end
      puts
    end
  end

  def start_loop
    while true
      self.render
      cursor.get_input
      system("clear")
    end
  end



end
