class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train
  end

  def trains_by_types(type)
    trains.filter{ |train| train.type == type }.count
  end

  def go_train(train)
    trains.delete(train)
  end
end

class Route
  attr_reader :start_station
  attr_reader :end_station
  attr_reader :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station)
  end
end

class Train
  attr_accessor :speed
  attr_accessor :wagon_count
  attr_reader :type
  attr_accessor :route
  attr_reader :current_station_index

  def initialize(number, type, wagon_count)
    @speed = 0
    @number = number
    @type = type
    @wagon_count = wagon_count
  end

  def speed_up
    self.speed += 10
  end

  def speed_down
    self.speed -= 10 if speed > 0
  end

  def add_wagon
    self.wagon_count += 1 if speed == 0
  end

  def remove_wagon
    self.wagon_count -= 1 if speed == 0
  end

  def add_route(route)
    self.route = route
    @current_station_index = 0
  end

  def next_station
    routes.stations[current_station_index + 1]
  end

  def previous_station
    routes.stations[current_station_index - 1] if current_station_index >= 0
  end

  def current_station
    routes.stations[current_station_index]
  end

  def move_forward
    self.current_station_index += 1 if next_station
  end

  def move_backward
    self.current_station_index -= 1 if previous_station
  end

  def stations
    [previous_station, current_station, next_station]
  end
end