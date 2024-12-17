class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_types
    passenger_trains = @trains.filter { |train| train.type == 'пассажирский' }
    cargo_trains = @trains.filter { |train| train.type == 'грузовой' }
    puts "#{passenger_trains.count} пассажирских поездов на станции"
    puts "#{cargo_trains.count} грузовых поездов на станции"
  end

  def go_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    @stations.delete(station)
  end
end

class Train
  attr_reader :speed
  attr_reader :wagon_count
  attr_reader :type

  def initialize(number, type, wagon_count)
    @speed = 0
    @number = number
    @type = type
    @wagon_count = wagon_count
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 10 if @speed > 0
  end

  def add_wagon
    @wagon_count += 1 if @speed == 0
  end

  def remove_wagon
    @wagon_count -= 1 if @speed == 0
  end

  def add_route(route)
    @routes = route
    @station = route.stations[0]
  end

  def move_forward
    prev_station_index = @routes.stations.find_index(@station)
    if prev_station_index < @routes.stations.count
      @station = @routes.stations[prev_station_index + 1]
    end
  end

  def move_backward
    prev_station_index = @routes.stations.find_index(@station)
    if prev_station_index > 0
      @station = @routes.stations[prev_station_index - 1]
    end
  end

  def station_around
    station_index = @routes.stations.find_index(@station)
    puts "Предыдущая станция #{station_index <= 0 ? @routes.stations[station_index] : @routes.stations[station_index - 1]}"
    puts "Текущая станция #{@routes.stations[station_index]}"
    puts "Следующая станция #{station_index >= @routes.stations.count ? @routes.stations[station_index] : @routes.stations[station_index + 1]}"
  end
end