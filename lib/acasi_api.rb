module Acasi
  attr_accessor :api_url
  attr_accessor :api_key

  class WhoIs
    def self.awesome?
      puts "ACASI IS AWESOME V 0.0.3!!"
    end
  end

  class ItemCategories
    def self.all
      JSON.parse(RestClient::Request.execute(
      method: :get,
      url: "#{Acasi.api_url}/item_categories",
      headers: {params: {api_token: Acasi.api_key}}
      ).body)
    end
  end

end

