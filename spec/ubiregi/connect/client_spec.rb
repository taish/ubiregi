require 'spec_helper'

describe Ubiregi::Connect::Client do

  before do
    # @client = Ubiregi::Connect::Client.new(:access_token => 'ak', :refresh_token => 'rt', :client_id => 'ci', :client_secret => 'cs')
    @client = Ubiregi::Connect::Client.new do |config|
      config.access_token  = "Your access token"
      config.refresh_token = "Your refresh token"
      config.client_id  = "Your client id"
      config.client_secret = "Your client secret"
    end
  end

  describe '.new' do
    context 'when invalid credentials are provided' do
      it 'raises a ClientError exception' do
        expect { Ubiregi::Connect::Client.new(:access_token => [1234, 4321]) }.to raise_error(Ubiregi::Error::ClientError)
      end
    end

    context 'when no credentials are provided' do
      it 'does not raise an exception' do
        expect { Ubiregi::Connect::Client.new }.not_to raise_error
      end
    end
  end

  describe '#connection' do
    it 'looks like Faraday connection' do
      expect(@client.send(:connection)).to respond_to(:run_request)
    end

    it 'memoizes the connection' do
      c1, c2 = @client.send(:connection), @client.send(:connection)
      expect(c1.object_id).to eq(c2.object_id)
    end
  end
end
