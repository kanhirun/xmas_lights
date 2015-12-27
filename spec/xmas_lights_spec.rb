require_relative '../lib/xmas_lights'

describe MaxLEDCalculator do
  describe '#process' do
  end

  describe '#calculate([Fixnum])' do
    it 'returns the max number of LEDs based on the number of hours' do
      num_of_leds = MaxLEDCalculator.calculate(1)
      expect(num_of_leds).to be 300
    end

    it 'returns the max number of LEDs based on the number of hours' do
      num_of_leds = MaxLEDCalculator.calculate(4)
      expect(num_of_leds).to be 75
    end
  end

  describe '#effective_current' do
    it 'returns the effective current based on the hours' do
      effective_current = MaxLEDCalculator.effective_current(1)
      expect(effective_current).to eq 1200  # in mA
    end

    it 'returns the effective current based on the hours' do
      effective_current = MaxLEDCalculator.effective_current(4)
      expect(effective_current).to eq 300  # in mA
    end
  end

  describe '#minimum_number_of_leds([Fixnum])' do
    it 'returns the min number of LEDS based on the number of hours' do
      effective_current = 300
      min = MaxLEDCalculator.minimum_number_of_leds(effective_current)
      expect(min).to eq 15
    end

    it 'returns the min number of LEDS based on the number of hours' do
      effective_current = 1200
      min = MaxLEDCalculator.minimum_number_of_leds(effective_current)
      expect(min).to eq 60
    end
  end

  describe '#multiplier([Fixnum])' do
    it 'returns the multiplier' do
      min = 15
      results = MaxLEDCalculator.multiplier(min)
      expect(results).to eq 75
    end

    it 'returns the multiplier' do
      min = 60
      results = MaxLEDCalculator.multiplier(min)
      expect(results).to eq 300
    end
  end

  #behaves_like 'singleton'
end
