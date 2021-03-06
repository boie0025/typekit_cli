require 'httparty'
module TypekitCLI
  module Services
    class TypekitAPI
      DEFAULT_ENDPOINT = 'https://typekit.com/api/v1/json'
      attr_accessor :resource, :id, :query_parameters
      attr_writer :json_endpoint
      attr_reader :uri_object

      # @param [String | Symbol] resource the name of the resource to query
      # @param [Hash] opts set instance variables.
      # @option opts [Integer | String] :id the ID to send to the resource
      # @option opts [Hash] :query_parameters A hash of querystring parameters.
      # @option opts [String] :json_endpoint override the environment and default endpoint.
      def initialize(resource, opts = {})
        self.resource = resource
        opts.each do |k, v|
          meth = "#{k}="
          self.send(meth, v) if self.respond_to?(meth)
        end
      end

      # @returns [String] URL for endpoint from config or default, depending on
      #  if TYPEKIT_JSON_ENDPOINT is set or not.
      def json_endpoint
        @json_endpoint ||= (ENV['TYPEKIT_JSON_ENDPOINT'] || DEFAULT_ENDPOINT)
      end

      # @return [Hash] the response from Typekit
      def execute!
        HTTParty.get(base_url, query: query_parameters, headers: headers).to_h
      end

      # @return [String] the url built, including endpoint, resource and ID if provided.
      def base_url
        [json_endpoint, resource, id].compact.join('/')
      end

      # @return [Hash] headers to set up authentication for connecting to the API.
      def headers
        { "X-Typekit-Token" => typekit_token }
      end

      private

      def typekit_token
        unless (typekit_token = ENV['TYPEKIT_TOKEN'])
          raise ConfigurationError, "You must set a TYPEKIT_TOKEN environment variable."
        end
        typekit_token
      end

    end
  end
end
