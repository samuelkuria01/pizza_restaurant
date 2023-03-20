class RestaurantsController < ApplicationController

    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    #GET/restaurants/:id
    def show
        restaurant = find_by
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
        restaurant = find_by
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render json: {error: "Restaurant not found"},status: :not_found
        end
    end

    #update/restaurant/:id
    def update
        restaurant = find_by
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

    def find_by
    Restaurant.find_by(id: params[:id])
    end
end
