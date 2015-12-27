class MaxLEDCalculator
  def self.calculate(hours)
    eff_curr = effective_current(hours)
    min = minimum_number_of_leds(eff_curr)
    multiplier(min)
  end

  def self.effective_current(hours)
    1200 / hours
  end

  def self.minimum_number_of_leds(effective_current)
    effective_current / 20
  end

  def self.multiplier(min)
    min * 5
  end
end
