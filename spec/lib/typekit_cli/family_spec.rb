require 'spec_helper'

module TypekitCLI
  describe Family do
    let(:family) do
      { 'id' => 'abcdef',
        'name' => 'Awesome',
        'slug' => 'awesome',
        'css_names' => ['awesome'],
        'css_stack' => '"awesome",sans-serif',
        'subset' => 'default',
        'variations' => ['n0'] }
    end

    subject { Family.new(family) }

    describe 'Convenience methods' do
      Family::ATTRIBUTES.each do |meth|
        describe "##{meth}" do
          it 'returns the family #{meth} value' do
            expect(subject.send(meth)).to eq family[meth.to_s]
          end
        end
      end
    end

  end
end
