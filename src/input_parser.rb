class InputParser
  attr_accessor :file_path

  def initialize(file_path)
    self.file_path = file_path
  end

  def parse!
    lines = file_content.split("\n")
    dimensions = parse_size(lines[0])

    rovers = lines[1..-1].each_slice(2).map do |rover_config|
      parse_rover_config(rover_config[0], rover_config[1])
    end

    { dimensions: dimensions, rovers: rovers }
  end

  private
  def parse_size(line)
    fields = line.split(" ")
    { width: fields[0], height: fields[1] }
  end

  def parse_rover_config(position, movements)
    position_items = position.split(' ')
    {
      position: { x: position_items[0], y: position_items[1], orientation: position_items[2] },
      movements: movements.split(' ')
    }
  end

  def file_content
    @file_content ||= File.read(file_path)
  end
end