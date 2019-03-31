class Room

  attr_accessor :fee, :capacity, :till, :song_playlist, :current_occupants

  def initialize (fee, capacity, till)
    @fee = fee
    @capacity = capacity
    @till = till
    @song_playlist = []
    @current_occupants = []
  end

  def customer_check_in (guest)
    if guest.wallet >= @fee
    guest.wallet -= @fee
    @till += @fee
  else return false
    p "Insufficient Funds"
  end
    if @current_occupants.length >= @capacity
      return false
      p "Full Capacity Reached"
    end
    @current_occupants.push(guest)
  end

  def customer_check_out (guest)
    @current_occupants.delete(guest)
  end

  def add_song_to_playlist(song)
    @song_playlist.push(song)
  end

  def guest_buys_drink (guest, drink)

    if guest.purchased_drinks.count >= 3
      return false
      p "Too drunk"
    end
    if guest.wallet >= drink.cost
    guest.wallet -= drink.cost
    @till += drink.cost
    guest.purchased_drinks.push(drink)
  else return false
    p "Insufficient Funds"
  end
  end


end
