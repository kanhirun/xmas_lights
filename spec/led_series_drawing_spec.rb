require_relative '../lib/led_series_drawing'

describe LEDSeriesDrawing do
  describe '#to_s' do
    it 'returns a single LED' do
      led = LEDSeriesDrawing.new(1)
      expected = '--|>|--'

      expect(led.to_s).to eq expected
    end

    it 'returns two LEDs' do
      led = LEDSeriesDrawing.new(2)
      expected = '--|>|--|>|--'

      expect(led.to_s).to eq expected
    end
  end
end
