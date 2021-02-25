require_relative './src/input_parser'
require_relative './src/dimensions'
require_relative './src/plateau'

$DEBUG = ENV['DEBUG']

input = InputParser.new('input.txt').parse!
dimensions = Dimensions.build_from_config(input[:dimensions])
simulation_result = Plateau.new(dimensions, input[:rovers]).run

puts simulation_result
