# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'dotenv/load'
require 'json'
require 'CGI'

URL = 'https://us-street.api.smartystreets.com/street-address'
LICENSE = 'us-core-cloud'
STREET = '1600 amphitheatre pkwy'
CITY = 'mountain+view'
ZIP = '9000'
STATE = 'CA'

# sanitize input before adding it to the request
# sanitazed_input = CGI.escape(STREET)
# puts sanitazed_input

# TODO: shorten this line
uri = URI("#{URL}?auth-id=#{ENV['AUTH_ID']}&auth-token=#{ENV['AUTH_TOKEN']}&license=#{LICENSE}&street=#{STREET}&city=#{CITY}&zip=#{ZIP}&state=#{STATE}")
response = Net::HTTP.get_response(uri)
# puts response.body if response.is_a?(Net::HTTPSuccess)
# add error handling
json = JSON.parse(response.body)
# puts json[0] - only need the first in the array
puts json[0]['delivery_line_1'].concat(json[0]['last_line'])

# Response example:
# [
#     {"input_index":0,
#     "candidate_index":0,
#     "delivery_line_1":"1600 Amphitheatre Pkwy",
#     "last_line":"Mountain View CA 94043-1351",
#     "delivery_point_barcode":"940431351000",
#     "components":{
#         "primary_number":"1600",
#         "street_name":"Amphitheatre",
#         "street_suffix":"Pkwy",
#         "city_name":"Mountain View",
#         "default_city_name":"Mountain View",
#         "state_abbreviation":"CA",
#         "zipcode":"94043",
#         "plus4_code":"1351",
#         "delivery_point":"00",
#         "delivery_point_check_digit":"0"},
#     "metadata":{
#         "record_type":"S",
#         "zip_type":"Standard",
#         "county_fips":"06085",
#         "county_name":"Santa Clara",
#         "carrier_route":"C909",
#         "congressional_district":"16",
#         "rdi":"Commercial",
#         "elot_sequence":"0103",
#         "elot_sort":"A",
#         "latitude":37.423560,
#         "longitude":-122.086520,
#         "precision":"Zip9",
#         "time_zone":"Pacific",
#         "utc_offset":-8,
#         "dst":true},
#     "analysis":{
#         "dpv_match_code":"Y",
#         "dpv_footnotes":"AABB",
#         "dpv_cmra":"N",
#         "dpv_vacant":"N",
#         "dpv_no_stat":"Y",
#         "active":"Y"}
#         }
#     ][20:58:33]
