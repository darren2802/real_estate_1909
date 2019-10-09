require_relative './room'

class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub('$','').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    rooms_in_cat = []
    @rooms.each { |room| rooms_in_cat << room if room.category == category }
    rooms_in_cat
  end

  def area
    total_area = 0
    @rooms.each { |room| total_area += room.area }
    total_area
  end

end
