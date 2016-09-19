# class EdamamRecipeService
# 
#   def initialize
#     @conn = Faraday.new("https://api.edamam.com/")
#   end
#
#   def data(search)
#     response = @conn.get do |req|
#       req.url 'search', :app_key => ENV["EDAMAM_RECIPE_APP_KEY"], :app_id => ENV["EDAMAM_RECIPE_APP_ID"]
#       req.params['q'] = "#{search}"
#     end
#     parse(response.body)
#   end
#
#   private
#     def parse(response)
#       JSON.parse(response)
#     end
# end
