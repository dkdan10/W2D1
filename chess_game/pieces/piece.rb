class Piece
  attr_accessor :color, :pos, :type, :board
  def initialize(color, board, pos)
    # @type = type
    @color = color
    @board = board
    @pos = pos
    @type = get_type
  end

  def get_type
    @type = self.class.to_s.downcase.to_sym
  end
  
  def self.get_class(new_pos)
    x, y = new_pos
    return NullPiece if x.between?(2,5)
    return Pawn if x == 1 || x == 6
    places = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]
    return Object.const_get(places[y].capitalize)
  end
  

  def moves
    [0,0]
  end

  def valid_move?(end_pos)
    return false if !self.board.valid_pos?(end_pos) || self.board[end_pos].color == self.color
    #get current position and compare to end position
    #if board[end_pos] is a null piece or a piece of opposite color
    true
  end


end