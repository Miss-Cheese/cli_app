require 'uri'
require 'net/http'
require 'dotenv/load'

URL = 'https://us-street.api.smartystreets.com/street-address'
LICENSE = 'us-core-cloud'
STREET = '1600+amphitheatre+pkwy'
CITY = 'mountain+view'
STATE = 'CA'

uri = URI("#{URL}?auth-id=#{ENV['AUTH_ID']}&auth-token=#{ENV['AUTH_TOKEN']}&license=#{LICENSE}&street=#{STREET}&city=#{CITY}&state=#{STATE}")
response = Net::HTTP.get_response(uri)
puts response.body
