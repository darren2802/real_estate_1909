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

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room| room.area }
  end

  def rooms_by_category
    categories = []
    @rooms.each do |room|
      categories << room.category unless categories.include?(room.category)
    end

    rooms_by_cat = Hash.new

    categories.each do |category|
      rooms_by_cat[category] = []
      @rooms.each do |room|
        rooms_by_cat[category] << room if room.category == category
      end
    end

    rooms_by_cat

  end

end
