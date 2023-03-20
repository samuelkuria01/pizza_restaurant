class RestaurantPizza < ApplicationRecord
    validate :price, numericality: { greater_than_or_equal_to:1, less_than_or_equal_to: 30, message: "must be between 1 and 30"}

end
