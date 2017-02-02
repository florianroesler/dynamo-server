require 'net/http'
require 'json'
class Pricing
  def self.prices
    @@prices ||= begin
      uri = URI.parse("http://a0.awsstatic.com/pricing/1/ec2/linux-od.min.js")
      https = Net::HTTP.new(uri.host,uri.port)
      req = Net::HTTP::Get.new(uri.path)
      res = https.request(req)

      body = res.body.split('callback(')[1].strip[0..-3]
      body = body.gsub(/{\s*(\w)/, '{"\1').gsub(/,\s*(\w)/, ',"\1').gsub(/(\w):/, '\1":')

      prices = JSON.parse(body)
      region = Java::FrDynamoEc2::EC2MachineManager.getInstance.getRegion
      region_object = prices['config']['regions'].find { |r| r['region'] == region }
      instances = region_object['instanceTypes'].map do |types|
        types['sizes'].map do |size|
          { type: size['size'], price: size['valueColumns'].first['prices'].values.first }
        end
      end.flatten
    end
  end
end
