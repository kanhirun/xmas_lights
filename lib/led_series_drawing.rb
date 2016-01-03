class LEDSeriesDrawing
  def initialize(n)
    @leds = Array.new(n){ led }
  end

  def to_s
    connector + @leds.join(connector) + connector
  end

  def length
    @leds.to_s.length
  end

  private
    def led
      '|>|'
    end

    def connector
      '--'
    end
end
