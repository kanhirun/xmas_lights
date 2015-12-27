class MaxLEDCalculator
  class << self
    undef_method :new
  end

  def self.process(input)
    return '' if input == ''

    hours = input.split("\n").map(&:to_i)
    if hours.length > 1
      hours.map{ |hour| calculate(hour) }.join("\n") + "\n"
    else
      calculate(hours[0]).to_s
    end
  end

  def self.calculate(hours)
    max_number_of_LEDS_in_parallel(hours) * max_number_of_LEDS_in_series
  end

  def self.max_number_of_LEDS_in_parallel(hours)
    battery_capacity / hours / led_current
  end

  def self.max_number_of_LEDS_in_series
    5
  end

  private
    def self.battery_capacity
      1200  # in mA / hr
    end

    def self.led_current
      20  # in mA
    end
end
