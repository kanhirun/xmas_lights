require 'active_support/core_ext/string'
require_relative '../lib/calculator_printer'

describe CalculatorPrinter do
  let(:calculator) { class_double('Calculator') }
  before do
    allow(CalculatorPrinter).to receive(:calculator){ calculator }
  end

  describe '#print' do
    it "doesn't output when given an empty string" do
      empty_string = ''

      expect do
        CalculatorPrinter.print(empty_string)
      end.not_to output.to_stdout
    end

    it 'outputs the result when given an input' do
      input  = '1'
      result = '10'
      expect(calculator).to receive(:calculate).and_return(result)

      expect do
        CalculatorPrinter.print(input)
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
        CalculatorPrinter.print(line_input)
      end.to output(line_results).to_stdout
    end

    # TODO: Silence this output so that it doesn't mess up the test output
    it 'returns nil' do
      expect(calculator).to receive(:calculate).and_return('10')
      return_val = CalculatorPrinter.print('1')
      expect(return_val).to be_nil
    end
  end
end
