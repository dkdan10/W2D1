require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  def initialize(color, board, pos)
    super(:nil, board, pos)
  end
end