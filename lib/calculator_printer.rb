require 'active_support/core_ext/string'
require 'active_support/core_ext/enumerable'

class CalculatorPrinter
  def self.print_number_format(input)
    return nil if input == ''

    data    = data(input)
    results = data.map do |d|
      calculator.calculate(d)
    end

    $stdout.print lines(results)
  end

  def self.print_circuit_format(input)
    data = data(input)[0]
    nrow = calculator.max_number_of_LEDS_in_series
    ncol = calculator.max_number_of_LEDS_in_parallel(data)
    drawing = LEDCircuitDrawing.new(nrow: nrow, ncol: ncol)

    print drawing.to_s
  end

  private
    def self.calculator
      MaxLEDCalculator
    end

    def self.data(lines)
      lines.split("\n").map(&:to_i)
    end

    def self.lines(data)
      if data.many?
        data.join("\n") + "\n"
      else
        data.first.to_s
      end
    end
end
