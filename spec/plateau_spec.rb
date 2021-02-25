require_relative '../src/plateau'
require_relative '../src/dimensions'

describe Plateau do
  let(:dimensions) { Dimensions.new(5,5) }

  it "should move north" do
    rover_configs = [{
      position: { x: 2, y: 2, orientation: 'N' },
      movements: ['M']
    }]
    plateau = Plateau.new(dimensions, rover_configs)

    position = plateau.run[0]
    expect(position.y).to eq(rover_configs[0][:position][:y]+1)
  end

  it "should be able to rotate and move south" do
    rover_configs = [{
      position: { x: 2, y: 2, orientation: 'N' },
      movements: ['R', 'R', 'M']
    }]
    plateau = Plateau.new(dimensions, rover_configs)

    position = plateau.run[0]
    expect(position.y).to eq(rover_configs[0][:position][:y]-1)
  end

  it "fail if the rover get out of the plateau" do
    rover_configs = [{
      position: { x: dimensions.width, y: dimensions.height, orientation: 'N' },
      movements: ['M']
    }]
    plateau = Plateau.new(dimensions, rover_configs)
    expect { plateau.run }.to raise_error(Plateau::OutOfBoundariesError)
  end
end
