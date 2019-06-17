class Piece
  attr_accessor :color, :pos, :type
  def initialize(color, board, pos)
    # @type = type
    @color = color
    @board = board
    @pos = pos
    @type = get_type
  end
  
  def get_type
    x, y = pos
    return nil if x.between?(2,5)
    return :pawn if x == 1 || x == 6
    places = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]
    return places[y]
  end

end