require_relative './rover'
require_relative './position'

class Plateau
  class OutOfBoundariesError < StandardError;end

  attr_accessor :dimensions, :rover_configs

  def initialize(dimensions, rover_configs)
    self.dimensions = dimensions
    self.rover_configs = rover_configs
  end

  def run
    rover_configs.map do |rover_config|
      simulate_rover(rover_config)
    end
  end

  def check_boundaries(position)
    if position.x > dimensions.width || position.y > dimensions.height
      raise OutOfBoundariesError.new("out of boundaries at #{position}")
    end
  end

  private
  def simulate_rover(rover_config)
    position = Position.build_from_config(rover_config[:position])
    position_check = lambda {|position| check_boundaries(position) }

    rover = Rover.new(position, rover_config[:movements], position_check)
    rover.run
  end
end
