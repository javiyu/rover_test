class Rover
  attr_accessor :position, :movements, :position_check

  def initialize(position, movements, position_check)
    self.position = position
    self.movements = movements
    self.position_check = position_check
  end

  def run
    puts '---' if $DEBUG
    movements.each do |movement|
      move(movement)
      puts position if $DEBUG
    end
    position
  end

  private

  def move(movement)
    case movement
    when 'L'
      rotate_left
    when 'R'
      rotate_right
    when 'M'
      move_forward
    end
  end

  def rotate_left
    case position.orientation
    when 'N'
      position.orientation = 'W'
    when 'S'
      position.orientation = 'E'
    when 'E'
      position.orientation = 'N'
    when 'W'
      position.orientation = 'S'
    end
  end

  def rotate_right
    case position.orientation
    when 'N'
      position.orientation = 'E'
    when 'S'
      position.orientation = 'W'
    when 'E'
      position.orientation = 'S'
    when 'W'
      position.orientation = 'N'
    end
  end

  def move_forward
    case position.orientation
    when 'N'
      position.y = position.y + 1
    when 'S'
      position.y = position.y - 1
    when 'E'
      position.x = position.x + 1
    when 'W'
      position.x = position.x - 1
    end
    position_check.call(position)
  end
end
