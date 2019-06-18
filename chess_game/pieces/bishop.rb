require_relative "modules/slideable"
require_relative "piece"

class Bishop < Piece
  include Slideable


  def moves
    move_dirs = [:diagonal]
    get_moves(move_dirs)
  end


end
