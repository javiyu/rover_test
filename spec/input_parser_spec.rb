require_relative '../src/input_parser'

describe InputParser do
  let(:dimensions) { Dimensions.new(5,5) }
  let(:file_content) do
    %Q{5 5
      1 2 N
      L M L M L M L M M
      3 3 E
      M M R M M R M R R M}
  end

  it "parse a valid file" do
    parser = InputParser.new('path')
    allow(parser).to receive(:file_content).and_return(file_content)
    input = parser.parse!

    expect(input[:dimensions][:height]).to eq('5')
    expect(input[:dimensions][:width]).to eq('5')
    expect(input[:rovers][0][:movements][0]).to eq('L')
    expect(input[:rovers][1][:movements][0]).to eq('M')
    expect(input[:rovers][0][:position][:x]).to eq('1')
    expect(input[:rovers][1][:position][:y]).to eq('3')
  end
end
