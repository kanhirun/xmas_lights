require 'active_support/core_ext/string'
require_relative '../lib/max_led_outputter'

require_relative '../lib/max_led_calculator'

describe MaxLEDOutputter do
  let(:calculator) { class_double(MaxLEDCalculator) }
  before do
    allow(MaxLEDOutputter).to receive(:calculator) { calculator }
  end

  describe '#puts' do
    it 'returns an empty string when given an empty string' do
      input = ''
      output = MaxLEDOutputter.puts(input)
      expect(output).to be_empty
    end

    it 'returns one line when given one line' do
      expect(calculator).to receive(:calculate).and_return('300')
      input = '1'

      output = MaxLEDOutputter.puts(input)

      expect(output).to eq '300'
    end

    it 'returns n lines when given n lines' do
      expect(calculator).to receive(:calculate).and_return('300', '75', '35', '25')
      input = <<-INPUT.strip_heredoc
        1
        4
        8
        12
      INPUT

      output = MaxLEDOutputter.puts(input)

      expect(output).to eq <<-OUTPUT.strip_heredoc
        300
        75
        35
        25
      OUTPUT
    end
  end
end
