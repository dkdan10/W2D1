Dir["./pieces/*.rb"].each {|file| require file }
require_relative "display"


class Board
  attr_accessor :display, :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    fill_board
    @display = Display.new(self)
  end

  private

  def [](position)
    x, y = position
    rows[x][y]
  end 

  def []=(position, value)
    x, y = position
    rows[x][y] = value
  end 

  def fill_board
    rows.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if x == 0 || x == 1 # Black Peices
          rows[x][y] = Piece.new(:black, self, [x,y]) 
        elsif x == 6 || x == 7 # White Pieces
          rows[x][y] = Piece.new(:white, self, [x,y]) 
        else #Null
          rows[x][y] = NullPiece
        end
      end
    end
  end

  public
  def move_piece(start_pos, end_pos)
    if self[start_pos] == NullPiece
      raise "There is no piece at #{start_pos}"
    elsif self[end_pos] != NullPiece #if it can land on enemy piece it is still a valid move. if color of start pos piece is not color of end pos piece. 
      raise "There is already a piece at #{end_pos}"
    end
    # TODO ELSE IF VALID MOVE
    # elsif self[start_pos].valid_move?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece
    self[end_pos].pos = end_pos
  end

  def valid_pos?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7)
  end


end
