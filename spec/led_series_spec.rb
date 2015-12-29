require_relative '../lib/led_series'

describe LEDSeries do
  describe '#to_s' do
    it 'returns a single LED' do
      led = LEDSeries.new(1)
      expected = '--|>|--'

      expect(led.to_s).to eq expected
    end

    it 'returns two LEDs' do
      led = LEDSeries.new(2)
      expected = '--|>|--|>|--'

      expect(led.to_s).to eq expected
    end
  end
end
