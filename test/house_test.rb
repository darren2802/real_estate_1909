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

  def test_add_4_rooms
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal [room_1, room_2, room_3, room_4], @house.rooms
  end

  def test_add_4_rooms_get_metrics
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal [room_1, room_2, room_3, room_4], @house.rooms
    assert_equal [room_1, room_2], @house.rooms_from_category(:bedroom)
    assert_equal [room_4], @house.rooms_from_category(:basement)
    assert_equal 1900, @house.area
  end

  def test_house_price_per_square_foot
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_house_rooms_sorted_by_area
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    assert_equal [room_1, room_2, room_3, room_4], @house.rooms_sorted_by_area
  end

  def test_rooms_by_category_hash
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)
    room_cats = {
      bedroom: [room_1, room_2],
      living_room: [room_3],
      basement: [room_4]
    }
    assert_equal room_cats, @house.rooms_by_category
  end

end
