require 'uri'
require 'net/http'
require 'json'

class SimpleHttpClient
  CONTENT_TYPE = { 'Content-Type' => 'application/json' }
  ACCEPT = { 'Accept' => 'application/json' }

  def initialize(base_url)
    @uri = URI.parse(base_url)
  end

  def get(path, header = {})
    request = Net::HTTP::Get.new("/#{path}")
    non_body_request(request, header)
  end

  def delete(path, header = {})
    request = Net::HTTP::Delete.new("/#{path}")
    non_body_request(request, header)
  end

  def post(path, body, header = {})
    request = Net::HTTP::Post.new(path)
    body_request(request, body, header)
  end

  def put(path, body, header = {})
    request = Net::HTTP::Put.new(path)
    body_request(request, body, header)
  end

  private

  def http
    Net::HTTP.new(@uri.host, @uri.port)
  end

  def non_body_request(request, header)
    request.initialize_http_header(ACCEPT.merge(header))
    execute request
  end

  def body_request(request, body, header)
    request.body = JSON.dump(body)
    request.initialize_http_header(CONTENT_TYPE.merge(header))
    execute request
  end

  def execute(request)
    http.request(request)
  end
end
