require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :type, :color
  def initialize
    @type = :null_piece
    @color = :none
  end

  def moves
    []
  end
end 