require 'spec_helper'

describe TypekitCLI::Kit do
  let(:all_json_response) { JSON.parse %q(
    {
      "kits": [
        {
          "id": "ajd4dmw",
          "link": "/api/v1/json/kits/ajd4dmw/"
        },
        {
          "id": "ard8twk",
          "link": "/api/v1/json/kits/ard8twk/"
        }
      ]
    })
  }

  let(:find_json_response) { JSON.parse %q(
    {
      "kit": {
        "name": "Example",
        "id": "nfx3ygt",
        "analytics": false,
        "domains": [
          "example.com"
        ],
        "families": [
          {
            "id": "gkmg",
            "name": "Droid Sans",
            "slug": "droid-sans",
            "css_names": [
              "droid-sans-1",
              "droid-sans-2"
            ],
            "css_stack": "\"droid-sans-1\",\"droid-sans-2\",sans-serif",
            "variations": [
              "n4"
            ],
            "subset": "default"
          }
        ]
      }
    })
  }

  context 'instance methods' do
    subject { TypekitCLI::Kit.new(find_json_response) }

    describe 'Convenience methods' do
      %i(name id analytics domains families).each do |meth|
        describe "##{meth}" do
          it 'returns the kit #{meth} value' do
            expect(subject.send(meth)).to eq find_json_response['kit'][meth.to_s]
          end
        end
      end
    end

    describe '#kit_attributes' do
      it 'returns the attributes of the kit' do
        expect(subject.kit_attributes).to eq find_json_response['kit']
      end
    end

  end


  context 'class methods' do
    subject { TypekitCLI::Kit }
    describe '.all' do
      before do
        allow(HTTParty).to receive(:get).and_return all_json_response
      end

      it 'delegates to TypekitAPI#execute!' do
        expect(subject.all).to eq all_json_response
      end

      it 'returns a hash' do
        expect(subject.all).to be_a Hash
      end
    end

    describe '.find' do
      before do
        allow(HTTParty).to receive(:get).and_return find_json_response
      end

      it 'delegates to TypekitAPI#execute!' do
        expect(subject.find("abcdef").attributes).to eq find_json_response
      end

      it 'returns a hash' do
        expect(subject.find("abcdef").attributes).to be_a Hash
      end
    end

  end

end
