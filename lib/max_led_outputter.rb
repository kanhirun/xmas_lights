require 'active_support/core_ext/enumerable'

class MaxLEDOutputter
  def self.print(input)
    return nil if input == ''

    data    = data(input)
    results = data.map do |d|
      calculator.calculate(d)
    end

    $stdout.print lines(results)
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
