require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../guests.rb")

class RoomTest < MiniTest::Test
  def setup
   @guest1 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @guest2 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @guest3 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @guest4 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @guest5 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @guest6 = Guest.new("Jim", 25, "Bohemien Rhapsody")
   @song2 = Song.new("Paranoid Android", "Radiohead")
   @room1 = Room.new(2, 5, 100)
  end


  def test_customer_check_in
    @room1.customer_check_in(@guest1)
    assert_equal(1, @room1.current_occupants.count)
    assert_equal(23, @guest1.wallet)
    assert_equal(102, @room1.till)
  end

  def test_if_room_is_at_capacity_during_check_in
    @room1.customer_check_in(@guest1)
    @room1.customer_check_in(@guest2)
    @room1.customer_check_in(@guest3)
    @room1.customer_check_in(@guest4)
    @room1.customer_check_in(@guest5)
    @room1.customer_check_in(@guest6)
    assert_equal(false, @room1.customer_check_in(@guest6))
  end

  def test_customer_check_out
    @room1.customer_check_in(@guest1)
    assert_equal(1, @room1.current_occupants.count)
    @room1.customer_check_out(@guest1)
    assert_equal(0, @room1.current_occupants.count)
    end

  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song2)
    assert_equal("Paranoid Android", @room1.song_playlist[0].title)
  end

  

end
