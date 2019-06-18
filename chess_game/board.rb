Dir["./pieces/*.rb"].each {|file| require file }
require_relative "display"
require "byebug"

class Board
  attr_accessor :display, :rows
  attr_reader :dupped

  def initialize(is_dupped = false)
    @rows = Array.new(8) {Array.new(8)}
    fill_board unless is_dupped
    @display = Display.new(self) unless is_dupped
    @dupped = is_dupped
  end

  def [](position)
    x, y = position
    rows[x][y]
  end 

  def []=(position, value)
    x, y = position
    rows[x][y] = value
  end 

  def fill_board
    rows.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        if x == 0 || x == 1 # Black Peices
          rows[x][y] = Piece.get_class([x,y]).new(:black, self, [x,y]) 
        elsif x == 6 || x == 7 # White Pieces
          rows[x][y] = Piece.get_class([x,y]).new(:white, self, [x,y]) 
        else #Null
          rows[x][y] = NullPiece.instance
        end
      end
    end
  end

  public
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "There is no piece at #{start_pos}"
    elsif self[start_pos].color == self[end_pos].color  
      raise "There is already a piece at #{end_pos}"
    end
   
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos].pos = end_pos

    if self[end_pos].color == :black && !dupped
      if self.in_check?(:white) #WHITE IS IN CHECK
        print "CHECK White"
        sleep(1)
        if self.checkmate?(:white) #WHITE LOSES
          print "CHECKMATE White"
          sleep(1)
        end
      end
    elsif self[end_pos].color == :white && !dupped
      if self.in_check?(:black)
        print "CHECK Black"
        sleep(1)
        if self.checkmate?(:black)
          print "CHECKMATE Black" 
          sleep(1)
        end
      end
    end
  end

  def valid_pos?(pos)
    x,y = pos
    x.between?(0,7) && y.between?(0,7)
  end

  def other_team_pieces(color)
    rows.flatten.select {|piece| piece.color != color && !piece.is_a?(NullPiece) }
  end

  def team_pieces(color)
    rows.flatten.select {|piece| piece.color == color}
  end
  
  def in_check?(color)
    king = rows.flatten.select{|piece| piece.color == color && piece.is_a?(King)}.first
    other_team_pieces(color).each do |piece|
      return true if piece.moves.any? {|pos| pos == king.pos}
    end
    false
  end

  def deep_dup
    new_board = Board.new(true)

    new_board.rows.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        piece_class = @rows[x][y].class
        if piece_class != NullPiece
          new_board.rows[x][y] = piece_class.new(@rows[x][y].color, new_board, [x,y])
        else
          new_board.rows[x][y] = piece_class.instance
        end
      end
    end
    
    new_board
  end

  def checkmate?(color)
    return false if !in_check?(color)
    team_pieces(color).each do |piece|
      start_pos = piece.pos
      piece.moves.each do |pot_move|
        test_board = self.deep_dup
        placeholder = test_board[pot_move]
        begin
          test_board.move_piece(piece.pos, pot_move)
          return false if !test_board.in_check?(color)
        ensure
          test_board.place_piece(piece, start_pos)
          test_board.place_piece(placeholder, pot_move)        
        end
      end
    end
    true
  end

  def place_piece(piece, pos)
    self[pos] = piece unless piece.is_a?(NullPiece)
    self[pos].pos = pos unless piece.is_a?(NullPiece)
  end


end
