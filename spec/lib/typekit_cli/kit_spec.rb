require 'spec_helper'

describe TypekitCLI::Kit do
  let(:kit_json_response) { %q(
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

  describe '.kits' do
    it 'returns a list of kits owned by the user' do
      expect(subject.class.kits).to eq kit_json_response
    end
  end
end
