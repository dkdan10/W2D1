require_relative "modules/slideable"
require_relative "piece"


class Rook < Piece
  include Slideable
  def moves
    move_dirs = [:lateral]
    get_moves(move_dirs)
  end

end
