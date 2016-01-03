require 'active_support/core_ext/string'

require_relative '../lib/led_circuit_drawing'

describe LEDCircuitDrawing do
  describe '#to_s' do
    it 'returns the identity when n = 1' do
      expected = '--|>|--'
      parallel = LEDCircuitDrawing.new(nrow: 1, ncol: 1)
      expect(parallel.to_s).to eq expected
    end

    it 'returns the identity when n = 1' do
      expected = '--|>|--|>|--'
      parallel = LEDCircuitDrawing.new(nrow: 2, ncol: 1)
      expect(parallel.to_s).to eq expected
    end

    it 'returns a compound view when n=2' do
      expected = <<-EXPECTED.strip_heredoc.rstrip
        --|>|--|>|--
        |          |
        --|>|--|>|--
      EXPECTED

      parallel = LEDCircuitDrawing.new(nrow: 2, ncol: 2)

      expect(parallel.to_s).to eq expected
    end

    it 'returns a compound view when n=3' do
      expected = <<-EXPECTED.strip_heredoc.rstrip
        --|>|--|>|--|>|--
        |               |
        --|>|--|>|--|>|--
      EXPECTED

      parallel = LEDCircuitDrawing.new(nrow: 3, ncol: 2)

      expect(parallel.to_s).to eq expected
    end
  end

  describe '#to_s' do
  end
end
