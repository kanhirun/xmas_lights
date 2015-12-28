require 'active_support/core_ext/string'
require_relative '../lib/max_led_outputter'

require_relative '../lib/max_led_calculator'

describe MaxLEDOutputter do
  let(:collaborator) { class_double(MaxLEDCalculator) }
  before do
    allow(MaxLEDOutputter).to receive(:calculator) { collaborator }
  end

  describe '#puts' do
    it "doesn't output when given an empty string" do
      empty_string = ''

      expect do
        MaxLEDOutputter.puts(empty_string)
      end.not_to output.to_stdout
    end

    it 'outputs the result when given an input' do
      input  = '1'
      result = '300'
      expect(collaborator).to receive(:calculate).and_return(result)

      expect do
        MaxLEDOutputter.puts(input)
      end.to output(result).to_stdout
    end

    # Simplify logic to increase fluency
    it 'outputs many line results when given line-separated input' do
      line_input = <<-INPUT.strip_heredoc
        1
        4
        8
        12
      INPUT
      line_results = <<-OUTPUT.strip_heredoc
        300
        75
        35
        25
      OUTPUT
      expect(collaborator).to receive(:calculate).and_return(
        '300', '75', '35', '25'
      )

      expect do
        MaxLEDOutputter.puts(line_input)
      end.to output(line_results).to_stdout
    end

    it 'returns nil' do
      expect(collaborator).to receive(:calculate).and_return('10')
      return_val = MaxLEDOutputter.puts('1')
      expect(return_val).to be_nil
    end
  end
end
