# Install

## On Gemfile
`gem 'simple_http_client'`

## Manually
`gem install simple_http_client`

# Usage
```
require 'simple_http_client'

http_client = SimpleHttpClient.new 'http://host:port'
http_client.get('/path', { 'Header-Key' => 'value' })
http_client.post('/path', { 'Body' => 'Content'}, { 'Header-Key' => 'value' })
```

# Development
`make` or `make spec` or `bundle install && rspec spec`

# License

This code is in the Public Domain.  See [LICENSE](./LICENSE)
