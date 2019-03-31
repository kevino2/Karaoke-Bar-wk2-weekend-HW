require("minitest/autorun")
require("minitest/rg")
require_relative("../songs.rb")

  class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Bohemien Rhapsody", "Queen")
  end

  def test_song_has_title
   assert_equal("Bohemien Rhapsody", @song1.title)
  end

  def test_song_has_artist
    assert_equal("Queen", @song1.artist)
  end

end
