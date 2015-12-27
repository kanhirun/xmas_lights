require 'active_support/core_ext/string'
require_relative '../lib/max_led_outputter'

# Collaborator
require_relative '../lib/max_led_calculator'

describe MaxLEDOutputter do
  describe '#process' do
    it 'returns an empty string when given an empty string' do
      input = ''
      output = MaxLEDOutputter.process(input)
      expect(output).to be_empty
    end

    it 'returns one line when given one line' do
      input = '1'
      output = MaxLEDOutputter.process(input)
      expect(output).to eq '300'
    end

    it 'returns n lines when given n lines' do
      input = <<-INPUT.strip_heredoc
        1
        4
        8
        12
      INPUT

      output = MaxLEDOutputter.process(input)

      expect(output).to eq <<-OUTPUT.strip_heredoc
        300
        75
        35
        25
      OUTPUT
    end
  end
end
