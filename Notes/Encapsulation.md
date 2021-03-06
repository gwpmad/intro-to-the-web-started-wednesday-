- What is Encapsulation in Ruby?"

Encapsulation is the practice of creating boundaries to contain the internal behaviour of the object. Good encapsulation prevents the internal behaviour (e.g. data) from being directly influenced by other objects, and in the long term, this reduces complexity and interdependence, and increases the modularity of your program. In the ideal situation, good encapsulation prevents internal changes to one class from breaking the interactions another class has with it.

- Give an example of a poorly-encapsulated class that uses an attr_accessor. 
```ruby
class VideogameCar
  attr_accessor :mass, :engine_size, :method_for_acceleration, :hash_of_mass, :hash_of_engines

  def initialize(model)
    @car_make = model
    @hash_of_mass = {:model1 = mass1, :model2 = mass2...}
    @hash_of_engines = {:model1 = engine_size1, :model2 = engine_size2...}
    @mass = predefined_mass_hash[@car_make]
    @engine_size = predefined_engine_hash[@car_make]
  end

  def drive(player_input,engine_size,mass)
    @acceleration = method_for_acceleration(player_input, engine_size , mass)
  end

  def method_for_acceleration
    #boring complex code, with blocks calling blocks inside of procs to send define methods into classes
  end

end


class Player
  
  def drive(car)
    car.drive(player_input,engine_size,mass)
  end

end
```
    
    
- Explain why it is a poor example of Encapsulation

The VideoGameCar class is messy and is overexposed. From the player's point of view, their only concern is driving the car, so the VideoGameCar should not make the internal calculations for the car available to the player.


- Refactor the class to better use Encapsulation. 

```ruby
class VideogameCar


HASH_OF_MASS = {:model1 = mass1, :model2 = mass2...}
HASH_OF_ENGINES = {:model1 = engine_size1, :model2 = engine_size2...}
private_constant :HASH_OF_MASS, :HASH_OF_ENGINES

  def initialize(model)
    @car_make = model
    @mass = predefined_mass_hash[@car_make]
    @engine_size = predefined_engine_hash[@car_make]
  end

  def drive(player_input)
    @acceleration = method_for_acceleration(player_input)
  end

private
  def method_for_acceleration(input_value)
    method(@engine_size, @mass) + method2(input_value)
    #boring complex code, with blocks calling blocks inside of procs to send define methods into classes
  end

end


class Player
  
  def drive(car)
    car.drive(player_input)
  end

end
```

Here in this example, the method_for_acceleration has been moved to private, and all the accessors have been removed - the Player class does not need to know what model the car is or be able to specify the engine_size and mass externally.



_Just like the wise geisha, mastering the Samurai with a coy flash of exposed wrist or ankle, so too can the aspiring Rubyist master the Class with seductive exposure of variables and methods._
