require "moip2"

require "vcr"
require "webmock"

RSpec.configure do |config|

end

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

# Helper methods
def sandbox_auth
  Moip2::Auth::Basic.new('01010101010101010101010101010101', 'ABABABABABABABABABABABABABABABABABABABAB')
end

def sandbox_oauth
  Moip2::Auth::OAuth.new "d63tz2xwyu0ewrembove4j5cbv2otpd"
end

def sandbox_client
  Moip2::Client.new(:sandbox, sandbox_auth)
end

def sandbox_oauth_client
  Moip2::Client.new :sandbox, sandbox_oauth
end

def sanbox_client_with_header
  Moip2::Client.new(:sandbox, sandbox_auth, { headers: { "Moip-Account" => "MPA-UY765TYBL912" } } )
end
