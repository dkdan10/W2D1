require "colorize"
require_relative "cursor"


class Display
  attr_reader :cursor, :pos_moves

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @pos_moves = []
    start_loop
  end

  EMOJIS = {
    white: {king: "♚", queen: "♛", rook: "♜", bishop: "♝", knight: "♞", pawn: "♟"},
    black: {king: "♔", queen: "♕", rook: "♖", bishop: "♗", knight: "♘", pawn: "♙"},
    none: {null_piece: " "}
  }
  def render
    moves = pos_moves

    puts "  "+(0..7).to_a.join(" ")
    cursor.board.rows.each_with_index do |row, i1|
      print i1.to_s + " "
      row.each_with_index do |tile, i2|
        
        thing_to_print = EMOJIS[tile.color][tile.type].colorize(tile.color)

        if [i1, i2] == cursor.cursor_pos
          if cursor.selected
            thing_to_print = thing_to_print.colorize(:background => :green)
          else
            thing_to_print = thing_to_print.colorize( :background => :red)
          end
        elsif moves.include?([i1, i2])
          thing_to_print = thing_to_print.colorize( :background => :blue)
        end
        print thing_to_print + " "
      end
      puts
    end
    print cursor.selected.pos if cursor.selected
  end

  def start_loop
    while true
      self.render
      cursor.get_input
      system("clear")
    end
  end

  def pos_moves
    if cursor.selected
      return cursor.selected.moves
    else
      return []
    end
  end



end
