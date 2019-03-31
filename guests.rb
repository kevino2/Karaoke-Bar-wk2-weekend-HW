class Guest
  attr_accessor :name, :wallet, :favourite_song, :purchased_drinks

def initialize(name, wallet, favourite_song)
  @name = name
  @wallet = wallet
  @favourite_song = favourite_song
  @purchased_drinks = []
end


def cheer_for_favourite(guest, song)
  if guest.favourite_song == song.title
  return "Whoo!"
end
end

end
