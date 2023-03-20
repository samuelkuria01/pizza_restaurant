class RestaurantsController < ApplicationController

    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    #GET/restaurants/:id
    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end


    #Post/restaurants/:id
    def create
        restaurant = Restaurant.create(restaurant_params)
        render json: restaurant,status: :created
    end

    #destroy/restaurant/:id
    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render json: {error: "Restaurant not found"},status: :not_found
        end
    end

    #update/restaurant/:id
    def update
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.update(restaurant_params)
            render json: restaurant, status: :accepted
            else
                render json: {error: "Restaurant not found"}, status: :not_found
            end
    end

    #All methods below are private
    private

    def restaurant_params
        params.permit(:name, :address)
    end
end
