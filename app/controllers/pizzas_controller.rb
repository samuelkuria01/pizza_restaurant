class PizzasController < ApplicationController

    def index
        pizzas = Pizza.all
        render json: pizzas
    end

    #GET/pizza/:id
    def show
        pizza = find_by
        if pizza
            render json: pizza
        else
            render json: {error: "Pizza not found"}, status: :not_found
        end
    end


   
    #All methods below are private
    private

    def find_by
        Pizza.find_by(id: params[:id])   
     end
    
end
