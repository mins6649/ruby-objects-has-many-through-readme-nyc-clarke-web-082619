class Waiter
    attr_accessor :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = meals.max {|meal1, meal2| meal1.tip <=> meal2.tip}
        best_tip.customer
    end

end