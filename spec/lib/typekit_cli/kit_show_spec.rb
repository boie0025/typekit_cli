require 'spec_helper'

module TypekitCLI
  describe KitShow do
    let(:kit) do
      OpenStruct.new({ 'id' => 'abcdef',
                       'name' => 'Kit',
                       'analytics' => 'good',
                       'domains' => ['example.com'] })
    end

    subject { KitShow.new(kit) }

    describe '#display' do

      context 'without errors' do
        # four attributes to show.
        it 'calls put four times' do
          expect(STDOUT).to receive(:puts).exactly(4).times
          subject.display
        end
      end

      context 'with errors' do
        let(:kit) { double('kit') }
        before do
          allow(kit).to receive(:has_errors?).and_return true
          allow(kit).to receive(:errors).and_return []
        end

        # once to show the error message.
        it 'calls puts once' do
          expect(STDOUT).to receive(:puts).exactly(1).times
          subject.display
        end
      end

    end
  end
end
