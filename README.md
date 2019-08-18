"# Mobike" 
Syntax:

class User:
user = User.new("name")
user.name
user.has_bike?
user.rent_bike(station)
user.return_bike_to(station, bike)
user.falldown?

class Bike:
bike = Bike.new
bike.broken?
bike.break!
bike.fix!

class Station:
station = Station.new
station.capacity
station.bikes
station.peminjam
station.register("name")
station.dock(bike)
station.full?
station.release(bike)
station.available_bike
station.check

class Workshop:
workshop = Workshop.new
workshop.slots
workshop.fix(station)
