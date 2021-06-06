class MealsController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit, :update,]
    

    def index
        
    end

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
