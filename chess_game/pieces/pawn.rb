class Pawn < Piece

  def moves
    moves = []
    x, y = self.pos
    #takes care of first step
    if self.color == :black
      if board.valid_pos?([x+1, y+1]) && board[[x+1, y+1]].color == :white
        moves << [x+1, y+1]
      end
      if board.valid_pos?([x+1, y-1]) && board[[x+1, y-1]].color == :white
        moves << [x+1, y-1]
      end
      moves << [x+1, y] if board.valid_pos?([x+1, y]) && board[[x+1, y]].is_a?(NullPiece)
    else
      if board.valid_pos?([x-1, y-1]) && board[[x-1, y-1]].color == :black
        moves << [x-1, y-1]
      end
      if board.valid_pos?([x-1, y+1]) && board[[x-1, y+1]].color == :black
        moves << [x-1, y+1]
      end
      moves << [x-1, y] if board.valid_pos?([x-1, y]) && board[[x-1, y]].is_a?(NullPiece)
    end

    #takes care of second step
    if x == 1 && self.color == :black #black pawns 
      moves.push([x+2, y]) if board[[x+1,y]].is_a?(NullPiece) && board[[x+2,y]].is_a?(NullPiece) 
    elsif x == 6 && self.color == :white #white pawns
      moves.push([x-2, y]) if board[[x-1,y]].is_a?(NullPiece) && board[[x-2,y]].is_a?(NullPiece)
    end

    moves

  end
  
end