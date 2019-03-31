require("minitest/autorun")
require("minitest/rg")
require_relative("../drink.rb")

  class SongTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", "Duff", 5)
  end

  def test_drink_type
   assert_equal("Beer", @drink1.drink_type)
  end

  def test_drink_brand
    assert_equal("Duff", @drink1.drink_brand)
  end

  def test_drink_has_cost
    assert_equal(5, @drink1.cost)
  end
end
