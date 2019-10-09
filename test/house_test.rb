require 'minitest/autorun'
require_relative '../lib/house'
require 'pry'

class TestHouse < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_house_instantiated
    assert_instance_of House, @house
  end

  def test_house_price
    assert_equal 400000, @house.price
  end

  def test_house_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_house_no_rooms
    assert_equal [], @house.rooms
  end

  def test_house_add_rooms
    room_1 = Room.new(:bedroom, 10, 13)
    assert_instance_of Room, room_1
    room_2 = Room.new(:bedroom, 11, 15)
    assert_instance_of Room, room_2
    @house.add_room(room_1)
    @house.add_room(room_2)
    assert_equal [room_1, room_2], @house.rooms
  end

end
