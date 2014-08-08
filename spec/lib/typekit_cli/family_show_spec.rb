require 'spec_helper'

module TypekitCLI
  describe FamilyShow do

    let(:family) do
      OpenStruct.new({ 'id' => 'abcdef',
                       'name' => 'Awesome',
                       'slug' => 'awesome',
                       'css_names' => ['awesome'],
                       'css_stack' => '"awesome",sans-serif',
                       'subset' => 'default',
                       'variations' => ['n0'] })
    end

    subject { FamilyShow.new(family) }

    describe 'display' do

      # Newline at the top, and 7 more times for the attributes.
      it 'calls puts eight times' do
        expect(STDOUT).to receive(:puts).exactly(8).times
        subject.display
      end

    end


  end
end
