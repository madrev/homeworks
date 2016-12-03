# app/models/driver.rb
class Driver
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end


# app/models/bus.rb
class Bus
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end


# app/models/route.rb
class Route
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # TODO: your code here
    #Create a hash with bus id's as keys and an array of bus drivers as the corresponding
    #value. E.g. {'1' => ['Joan Lee', 'Charlie McDonald', 'Kevin Quashie'], '2'
    # => ['Ed Michaels', 'Lisa Frank', 'Sharla Alegria']}
    result = []
    buses_with_drivers = self.buses.includes(:drivers)
    buses_with_drivers.each.do |bus|
      result[bus.id] = bus.drivers.to_a
    end
    result
  end
end
