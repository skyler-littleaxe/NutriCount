class MealsController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit, :update]
    before_action :find_meal, only: [:show, :edit, :update, :destroy]
    

    def index
        @meals = @current_user.log.meal.all
    end

    def new
        @meal = Meal.new
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save
            redirect_to meal_path(@meal)
        else
            render :new
        end
    end

    def show
        @meal
    end

    def edit
        @meal
    end

    def update
        if @meal.update(meal_params)
            redirect_to meal_path(@meal)
        else
            render :edit
        end
    end

    def destroy
        @meal.destroy
        redirect_to meals_path
    end
    
    private

    def meal_params
        params.require(:meal).permit(:meal_type, :meal_name, :cal_amount, :protein_amount, :carb_amount, :fat_amount, :water_amount, :sugar_amount, :cheat_meal)
    end

    def find_meal
        @meal = Meal.find(params[id])
    end
end
