module Slideable

  def get_moves(move_dirs)
    moves = []
    slides = {
      diagonal:[[1, 1], [-1, -1], [1, -1], [-1, 1]],
      lateral: [[1, 0], [-1, 0], [0, 1], [0, -1]] 
    }
    move_dirs.each do |dir|
      slides[dir].each do |orientation|
        x, y = orientation
        end_pos = [pos[0]+x, pos[1]+y]
        while valid_move?(end_pos)
          moves << end_pos
          break unless board[end_pos].is_a?(NullPiece)
          end_pos = [end_pos[0]+x, end_pos[1]+y]
        end
      end
    end
    moves
  end


end
