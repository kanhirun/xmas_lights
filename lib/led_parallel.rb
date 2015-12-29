require_relative 'led_series'

class LEDParallel
  def initialize(ncol:, nrow:)
    @num    = ncol
    @series = nrow
    @leds = Array.new(ncol) do
      LEDSeries.new(nrow)
    end
  end

  def to_s
    len = @leds.first.to_s.length
    sep = connector(len)
    @leds.map(&:to_s).join(sep)
  end

  private
    def connector(n)
      whitespaces = "\s" * (n - 2)
      "\n|#{whitespaces}|\n"
    end
end
