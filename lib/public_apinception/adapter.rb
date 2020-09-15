require_relative '../public_apinception.rb'
require_relative './category.rb'
class PublicApinception::Adapter
    @@BASE_URL = "https://api.publicapis.org"

    def get_categories
        uri = URI.parse(@@BASE_URL + "/categories")
        response = Net::HTTP.get_response(uri)
        categories = JSON.parse(response.body)
    end

    def create_categories
        PublicApinception::Category.new_from_array(self.get_categories)
    end

    def get_apis
        response = Net::HTTP.get_response(URI.parse(@@BASE_URL + "/entries"))
        # response = Net::HTTP.get_response(URI.parse(@@BASE_URL + "/entries?category=#{input}&https=true"))
        data = JSON.parse(response.body)
        apis = data["entries"]
        binding.pry
    end

    def create_apis
    end

    def initialize
        create_categories
    end

    # def get_user_info
    #     input = gets.strip
    #     uri = URI.parse(BASE_URL + "entries?category=" + input + "&https=true")
    #     # URI.parse(BASE_URL + "/authors/OL1A.json")
    #     response = Net::HTTP.get_response(uri)
    #     final = JSON.parse(response.body)
    # end
end

# PublicApinception::Adapter.new.get_apis("animals")