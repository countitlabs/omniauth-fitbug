# This is OAuth 1
require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Fitbug < OmniAuth::Strategies::OAuth
      DEFAULT_SCOPE = 'activity'

      option :name, 'fitbug'

      option :client_options, {
        :site => 'https://restusa.fitbug.com',
        :request_token_path => '/v1/oauth/request_token',
        :access_token_path => '/v1/oauth/access_token',
        :authorize_path => '/v1/oauth/login'
      }

      uid { '0' }

      info do { :foo => 'fee' } end
      extra do { :raw_info => raw_info } end

      #def request_phase
      #  options[:authorize_params] = client_params.merge(options[:authorize_params])
      #  super
      #end

      #def auth_hash
      #  OmniAuth::Utils.deep_merge(super, client_params.merge({:grant_type => 'authorization_code'}))
      #end

      def raw_info
        @raw_info
      end

      private

      #def client_params
      #  {:client_id => options[:client_id], :redirect_uri => callback_url ,:response_type => "code", :scope => DEFAULT_SCOPE}
      #end
    end
  end
end
