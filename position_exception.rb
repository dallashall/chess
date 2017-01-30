class PositionException < StandardError
  attr_reader :msg
  def initialize(msg, pos)
    @msg = "#{pos} is #{msg}"
  end
end
