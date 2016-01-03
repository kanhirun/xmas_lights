require 'active_support/core_ext/string'
require_relative '../lib/calculator_printer'

require_relative '../lib/led_series_drawing'
require_relative '../lib/led_circuit_drawing'
require_relative '../lib/max_led_calculator'

describe CalculatorPrinter do
  describe '#print_number_format' do
    let(:calculator) { class_double('Calculator') }
    before do
      allow(CalculatorPrinter).to receive(:calculator){ calculator }
    end

    it "doesn't output when given an empty string" do
      empty_string = ''

      expect do
        CalculatorPrinter.print_number_format(empty_string)
      end.not_to output.to_stdout
    end

    it 'outputs the result when given an input' do
      input  = '1'
      result = '10'
      expect(calculator).to receive(:calculate).and_return(result)

      expect do
        CalculatorPrinter.print_number_format(input)
      end.to output(result).to_stdout
    end

    it 'outputs the line-by-line results for each line of input' do
      line_input = <<-INPUT.strip_heredoc
        1
        2
        3
        4
      INPUT
      line_results = <<-OUTPUT.strip_heredoc
        10
        20
        30
        40
      OUTPUT
      expect(calculator).to receive(:calculate).and_return('10', '20', '30', '40')

      expect do
        CalculatorPrinter.print_number_format(line_input)
      end.to output(line_results).to_stdout
    end

    # TODO: Silence this output so that it doesn't mess up the test output
    it 'returns nil' do
      expect(calculator).to receive(:calculate).and_return('10')
      return_val = CalculatorPrinter.print_number_format('1')
      expect(return_val).to be_nil
    end
  end

  describe '#print_circuit_format' do
    it 'prints the circuit' do
      input = '20'
      results = <<-RESULTS.strip_heredoc
        *--|>|---|>|---|>|---|>|---|>|--*
        |                             |
        --|>|---|>|---|>|---|>|---|>|--
        |                             |
        --|>|---|>|---|>|---|>|---|>|--
      RESULTS

      expect do
        CalculatorPrinter.print_circuit_format(input)
      end.to output(results).to_stdout
    end

    it 'prints the circuit' do
      input = '1'

      # TODO: Use a fixture instead
      results = <<-RESULTS
*--|>|---|>|---|>|---|>|---|>|--*
RESULTS
      rows = <<-ROWS
|                             |
--|>|---|>|---|>|---|>|---|>|--
ROWS
      results += rows * (60-1)

      expect do
        CalculatorPrinter.print_circuit_format(input)
      end.to output(results).to_stdout
    end
  end
end
