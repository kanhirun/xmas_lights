require_relative '../lib/max_led_calculator'

describe MaxLEDCalculator do
  describe '#calculate([Fixnum])' do
    it 'returns the max number of LEDs based on the number of hours' do
      num_of_LEDS = MaxLEDCalculator.calculate(1)
      expect(num_of_LEDS).to be 300
    end

    it 'returns the max number of LEDs based on the number of hours' do
      num_of_LEDS = MaxLEDCalculator.calculate(4)
      expect(num_of_LEDS).to be 75
    end
  end

  describe '#max_number_of_LEDS_in_parallel(hours)' do
    it 'returns 15 LEDs in a series for 4 hours' do
      max = MaxLEDCalculator.max_number_of_LEDS_in_parallel(4)
      expect(max).to eq 15
    end

    it 'returns 60 LEDs for 1 hour' do
      max = MaxLEDCalculator.max_number_of_LEDS_in_parallel(1)
      expect(max).to eq 60
    end
  end

  describe '#max_number_of_LEDS_in_series' do
    it 'returns 5' do
      max = MaxLEDCalculator.max_number_of_LEDS_in_series
      expect(max).to eq 5
    end
  end

  # Behaves like a singleton
  it 'raises NoMethodError when calling .new' do
    expect{ MaxLEDCalculator.new }.to raise_error NoMethodError
  end
end
