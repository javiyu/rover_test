class Position
  attr_accessor :x, :y, :orientation

  def initialize(x, y, orientation)
    self.x = x.to_i
    self.y = y.to_i
    self.orientation = orientation
  end

  def to_s
    "#{x} #{y} #{orientation}"
  end

  def self.build_from_config(config)
    Position.new(config[:x], config[:y], config[:orientation])
  end
end
