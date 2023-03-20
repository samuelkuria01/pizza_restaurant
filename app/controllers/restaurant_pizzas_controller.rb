class RestaurantPizzasController < ApplicationController


    def index
        restaurantpizzas = RestaurantPizza.all
        render json: restaurants, include: :pizza
    end


    #Post/restaurants/:id
    def create
        restaurantpizza = RestaurantPizza.create(restaurantpizza_params)
        render json: restaurantpizza,status: :created
    end

    #All methods below are private
    private

    def restaurantpizza_params
        params.permit(:name, :address)
    end
end
