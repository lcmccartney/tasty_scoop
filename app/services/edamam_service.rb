class EdamamService

  def initialize
    @conn = Faraday.new("https://api.edamam.com/api")
  end

  def data(search)
    response = @conn.get do |req|
      req.url 'nutrition-data', :app_key => ENV["EDAMAM_APP_KEY"], :app_id => ENV["EDAMAM_APP_ID"]
      req.params['ingr'] = "#{search}"
    end
    parse(response.body)
  end

  private
    def parse(response)
      JSON.parse(response)
    end
end
