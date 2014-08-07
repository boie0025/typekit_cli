require 'spec_helper'
#require 'httparty'

module TypekitCLI
  module Services
    describe TypekitAPI do
      let(:query_parameters) { { awesome: true } }
      let(:base_url) { 'http://blar.com' }
      let(:resource) { 'resource' }
      let(:headers) { { 'X-Typekit-Token' => 'ABCDEFG' } }
      let(:id) { 2 }
      let(:full_url) { [base_url, resource, id].join('/') }
      let(:new_instance_opts) { { id: id,
                                  json_endpoint: base_url,
                                  query_parameters: query_parameters } }

      subject { TypekitAPI.new('resource', new_instance_opts) }

      describe 'initializer' do
        it 'sets the id' do
          expect(subject.id).to eq 2
        end

        it 'sets the json_endpoint' do
          expect(subject.json_endpoint).to eq 'http://blar.com'
        end

        it 'sets the query parameters' do
          expect(subject.query_parameters).to eq query_parameters
        end
      end

      describe '#execute!' do
        let(:httparty_params) { [full_url, query: query_parameters, headers: headers] }

        it 'returns an HTTParty object' do
          allow(ENV).to receive(:[]).and_return('ABCDEFG') # for auth token.

          expect(HTTParty).to receive(:get).with(*httparty_params)
          subject.execute!
        end

        it 'raises an exception if the auth token is not set' do
          allow(ENV).to receive(:[]).and_return(nil) # for auth token.
          allow(HTTParty).to receive(:get)
          expect { subject.execute! }.to raise_error ConfigurationError
        end
      end

      describe '#base_url' do
        it 'returns a compiled base_uri' do
          expect(subject.base_url).to eq full_url
        end
      end

      describe '#headers' do
        it 'returns a hash containing the API key' do
          allow(ENV).to receive(:[]).and_return('ABCDEFG') # for auth token
          expect(subject.headers).to eq headers
        end
      end


      describe '.json_endpoint' do
        subject { TypekitAPI.new('resource') }

        context 'TYPEKIT_JSON_ENDPOINT env set' do
          before do
            allow(ENV).to receive(:[]).and_return 'https://typekit.com/fake_endpoint'
          end

          it 'returns the value of the env variable' do
            expect(subject.json_endpoint).to eq 'https://typekit.com/fake_endpoint'
          end
        end

        context 'TYPEKIT_JSON_ENDPOINT env not set' do
          it 'returns the default value' do
            expect(subject.json_endpoint).to eq 'https://typekit.com/api/v1/json'
          end
        end

      end

    end

  end
end
