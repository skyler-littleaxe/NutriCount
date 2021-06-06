class LogsController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit, :update]
    before_action :find_log, only: [:show, :edit, :update, :destroy]
    

    def index
        @logs = @current_user.log.all
    end

    def new
        @log = Log.new
        1.times { @log.meal.build}
    end

    def create
        @log = Log.new(log_params)
        if @log.save
            redirect_to log_path(@log)
        else
            while @log.meal.length < 1
                @log.meal.build
            end
            render :new
        end
    end

    def show
        @log
    end

    def edit
        @log
    end

    def update
        if @log.update(log_params)
            redirect_to log_path(@log)
        else
            render :edit
        end
    end

    def destroy
        @log.destroy
        redirect_to logs_path
    end
    
    private

    def log_params
        params.require(:log).permit(:date, :cheat_day, :cal_goal, :protein_goal, :carb_goal, :fat_goal, :water_goal, :sugar_goal, :cal_goal, :protein_count, :carb_count, :fat_count, :water_count, :sugar_count, :user_id)
    end

    def find_log
        @log = Log.find(params[id])
    end
end
