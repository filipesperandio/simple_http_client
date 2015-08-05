require './spec/spec_helper'
require './spec/fake_server'

describe SimpleHttpClient do
  subject(:http_client) { SimpleHttpClient.new 'http://localhost:8080' }

  it 'responds to http base verbs' do
    expect(http_client).to respond_to(:get)
    expect(http_client).to respond_to(:post)
    expect(http_client).to respond_to(:put)
    expect(http_client).to respond_to(:delete)
  end

  context 'simple server interaction' do
    before :all do
      @server_pid = Thread.new do
        FakeServer.run
      end
      sleep 1
    end

    it '#get' do
      response = http_client.get('/')
      expect(response.code).to eq '200'
    end

    it '#post' do
      response = http_client.post('/', {})
      expect(response.code).to eq '200'
    end
  end
end
