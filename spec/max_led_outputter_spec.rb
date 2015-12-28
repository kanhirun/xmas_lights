require 'active_support/core_ext/string'
require_relative '../lib/max_led_outputter'

require_relative '../lib/max_led_calculator'

describe MaxLEDOutputter do
  let(:collaborator) { class_double(MaxLEDCalculator) }
  before do
    allow(MaxLEDOutputter).to receive(:calculator) { collaborator }
  end

  describe '#print' do
    it "doesn't output when given an empty string" do
      empty_string = ''

      expect do
        MaxLEDOutputter.print(empty_string)
      end.not_to output.to_stdout
    end

    it 'outputs the result when given an input' do
      input  = '1'
      result = '10'
      expect(collaborator).to receive(:calculate).and_return(result)

      expect do
        MaxLEDOutputter.print(input)
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
      expect(collaborator).to receive(:calculate).and_return('10', '20', '30', '40')

      expect do
        MaxLEDOutputter.print(line_input)
      end.to output(line_results).to_stdout
    end

    # TODO: Silence this output so that it doesn't mess up the test output
    it 'returns nil' do
      expect(collaborator).to receive(:calculate).and_return('10')
      return_val = MaxLEDOutputter.print('1')
      expect(return_val).to be_nil
    end
  end
end
