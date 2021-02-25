class Dimensions
  attr_accessor :width, :height

  def initialize(width, height)
    self.width = width.to_i
    self.height = height.to_i
  end

  def self.build_from_config(config)
    Dimensions.new(config[:width], config[:height])
  end
end
