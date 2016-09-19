class Food < OpenStruct
  attr_reader :calories,
              :total_weight,
              :diet_labels,
              :health_labels,
              :total_nutrients,
              :total_daily,
              :ingredients

  def initialize(search)
    data = EdamamService.new.data(search)
    @calories        = data['calories'] #kv
    @total_weight    = data['totalWeight'] #kv
    @diet_labels     = data['dietLabels'] #array
    @health_labels   = data['healthLabels'] #array
    @total_nutrients = data['totalNutrients'] #nested_hash
    @total_daily     = data['totalDaily'] #nested_hash
    @ingredients     = data['ingredients'] #hash_w_array
  end

  def search_term
    search = @ingredients.map do |hash|
      hash['text']
    end
    search.first
  end

  def diet_labels
    labels = @diet_labels.each do |label|
      label.gsub!('_', ' ')
    end
    labels
  end

  def health_labels
    labels = @health_labels.each do |label|
      label.gsub!('_', ' ')
    end
    labels.take(5)
  end

  def total_nutrients
    list = @total_nutrients.map do |k,v|
      "#{v["label"]}: #{v["quantity"]} #{v["unit"]}"
    end
    list
  end

  def 

  end
end
