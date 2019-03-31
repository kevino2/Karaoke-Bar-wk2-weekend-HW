class Drink


  attr_accessor :drink_type, :drink_brand, :cost

  def initialize (drink_type, drink_brand, cost)
    @drink_type = drink_type
    @drink_brand = drink_brand
    @cost = cost
  end

end
