class ChangeRestaurantPizzaColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurant_pizzas, :pizza_id, :pizzas_id
  end
end
