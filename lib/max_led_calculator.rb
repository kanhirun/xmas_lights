class MaxLEDCalculator
  class << self
    undef_method :new
  end

  def self.calculate(hours)
    max_number_of_LEDS_in_parallel(hours) * max_number_of_LEDS_in_series
  end

  def self.max_number_of_LEDS_in_parallel(hours)
    battery_capacity / hours / LED.current
  end

  def self.max_number_of_LEDS_in_series
    5
  end

  private
    def self.battery_capacity
      1200  # in mA / hr
    end

    class LED
      def self.current
        20  # in mA
      end
    end
end
