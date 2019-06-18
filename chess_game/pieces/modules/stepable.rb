module Stepable

  def moves
    moves = []
    steps = {
      knight:[[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]],
      king: [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]] 
    }
    steps[self.type].each do |orientation|
      x, y = orientation
      end_pos = [pos[0]+x, pos[1]+y]
      if valid_move?(end_pos)
        moves << end_pos
      end
    end
    moves
  end

end
