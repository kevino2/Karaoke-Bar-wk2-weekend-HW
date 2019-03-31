require("minitest/autorun")
require("minitest/rg")
require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../drink.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jim", 25, "Bohemien Rhapsody")
    @guest2 = Guest.new("John", 1, "Nuthin But A G Thang")
    @room1 = Room.new(2, 5, 100)
    @song1 = Song.new("Bohemien Rhapsody", "Queen")
    @drink1 = Drink.new("Beer", "Duff", 5)
  end

  def test_guest_has_name
    assert_equal("Jim", @guest1.name)
  end

  def test_guest_has_wallet
    assert_equal(25, @guest1.wallet)
  end

  def test_entry_fee_paid
    @room1.customer_check_in(@guest1)
    assert_equal(23, @guest1.wallet)
  end

  def test_guest_cheer_for_fave_song
    assert_equal("Bohemien Rhapsody", @guest1.favourite_song)
    assert_equal("Bohemien Rhapsody", @song1.title)
    assert_equal("Whoo!", @guest1.cheer_for_favourite(@guest1, @song1))
  end

  def test_insufficient_funds_to_enter
      assert_equal(false, @room1.customer_check_in(@guest2))
  end

  def test_guest_buys_drink
    @room1.guest_buys_drink(@guest1, @drink1)

    assert_equal(20, @guest1.wallet)
    assert_equal(1, @guest1.purchased_drinks.count)
  end

  def test_insufficient_funds_for_drink
      assert_equal(false, @room1.guest_buys_drink(@guest2, @drink1))
  end

  def test_too_drunk_to_get_served
    @room1.guest_buys_drink(@guest1, @drink1)
    @room1.guest_buys_drink(@guest1, @drink1)
    @room1.guest_buys_drink(@guest1, @drink1)
    @room1.guest_buys_drink(@guest1, @drink1)
    assert_equal(false, @room1.guest_buys_drink(@guest2, @drink1))
    assert_equal(10, @guest1.wallet)
    assert_equal(3, @guest1.purchased_drinks.count)
  end

end
