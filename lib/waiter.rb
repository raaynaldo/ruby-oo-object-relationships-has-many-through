class Waiter
  attr_accessor :name, :yrs_experiece

  @@all = []

  def initialize(name, yrs_experiece)
    @name = name
    @yrs_experiece = yrs_experiece
    @@all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    meals.max_by { |meal| meal.tip }.customer
  end

  def self.all
    @@all
  end
end
