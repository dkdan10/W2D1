require_relative "modules/stepable"
require_relative "piece"


class King < Piece
  include Stepable
  
end
