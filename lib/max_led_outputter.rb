class MaxLEDOutputter
  def self.process(input)
    return '' if input == ''

    hours = input.split("\n").map(&:to_i)
    if hours.length > 1
      hours.map do |hour|
        calculator.calculate(hour)
      end.join("\n") + "\n"
    else
      calculator.calculate(hours[0]).to_s
    end
  end

  private
    def self.calculator
      MaxLEDCalculator
    end
end
