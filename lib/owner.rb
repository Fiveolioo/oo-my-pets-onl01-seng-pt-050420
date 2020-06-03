class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor :cat, :dog
 @@owner = []
  def initialize(name, species="human")
    @name = name
    @species = species
    @@owner << self
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.all 
    @@owner 
  end
  
  def self.count 
    @@owner.size
  end
  
  def self.reset_all
    @@owner.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats 
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each {|cat| 
      cat.mood = "nervous"
      cat.owner = nil
    }
    self.dogs.each {|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end