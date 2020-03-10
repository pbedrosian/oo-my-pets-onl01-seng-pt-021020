class Owner
  attr_reader :name, :species

  @@all = []
  @@pets = {}

  def initialize(name)
    @name = name
    @@all << self
  end

  def species(species = "human")
    @species = species
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    cat = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select{|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.select{|cat| cat.mood = "happy"}
  end

  def sell_pets
    Dog.all.select{|dog| dog.mood = "nervous"}
    Cat.all.select{|cat| cat.mood = "nervous"}
    Dog.all.select{|dog| dog.owner = nil}
    Cat.all.select{|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
