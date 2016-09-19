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
    @calories        = data['calories']
    @total_weight    = data['totalWeight']
    @diet_labels     = data['dietLabels']
    @health_labels   = data['healthLabels']
    @total_nutrients = data['totalNutrients']
    @total_daily     = data['totalDaily']
    @ingredients     = data['ingredients']
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
      "#{v["label"]}: #{v["quantity"].round(2)} #{v["unit"]}"
    end
    list
  end

  def total_daily
    list = @total_daily.map do |k,v|
      "#{v["label"]}: #{v["quantity"].round(2)} #{v["unit"]}"
    end
    list
  end
end
