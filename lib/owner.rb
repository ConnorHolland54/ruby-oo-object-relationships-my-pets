class Owner
  # code goes here

  attr_reader :species, :name, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    save
  end

  def self.all
    @@all
  end

  def save 
    Owner.all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.count
    Owner.all.length
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    arr = Cat.all.select { |cat| cat.owner == self}
    arr.each do |cat|
      @cats << cat
    end
  end

  def dogs
    arr = Dog.all.select { |dog| dog.owner == self}
    arr.each do |dog|
      @dogs << dog
    end
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

  end

  def list_pets
    return "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end


end