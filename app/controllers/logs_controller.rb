class LogsController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit, :update,]
    

    def index
        @logs = @current_user.log.all
    end

    def new
        @log = Log.new
        1.times { @log.meal.build}
    end

    def create
        @log = Log.new(log_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
            while @log.meal.length < 1
                @log.meal.build
            end
            render :new
        end
    end

    def show
        @log = Log.find(params[id])
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
end
