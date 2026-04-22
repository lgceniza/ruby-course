class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  
  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0

    @@number_of_vehicles += 1
  end

  def number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles"
  end

  def speed
    puts "Speed is at #{@speed} mph"
  end

  def speed_up(s)
    @speed += s
    puts "Speed is up at #{@speed} mph"
  end

  def brake(s)
    @speed -= s
    puts "Speed is down to #{@speed} mph"
  end

  def shut_down
    @speed = 0
    puts "Vehicle is shut down."
  end

  def spray_paint(new_color)
    self.color = new_color
  end
end

class MyCar < Vehicle
  TYPE_OF_VEHICLE = "car"
end

class MyTruck < Vehicle
  TYPE_OF_VEHICLE = "truck"
end