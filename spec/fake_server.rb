require 'rack'

class FakeServer
  def self.app
    proc do |_env|
      ['200', { 'Content-Type' => 'application/json' }, ['A barebones rack app.']]
    end
  end

  def self.run
    Rack::Handler::WEBrick.run app
  end
end
