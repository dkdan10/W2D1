require_relative "modules/slideable"
require_relative "piece"


class Queen < Piece
  include Slideable
  def moves
    move_dirs = [:diagonal, :lateral]
    get_moves(move_dirs)
  end

end
