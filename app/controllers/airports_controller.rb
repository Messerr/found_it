class AirportsController < ApplicationController
  before_action :set_airport, only: [:edit, :update, :show, :destroy]
  def index
  	@airports = Airport.all
  end

  def new
  	@airport = Airport.new
  end

  def edit
  end

  def show
  end

  def create
  	@airport = Airport.new(airport_params)
  	if @airport.save
  		redirect_to airports_path, notice: "New airport created"
  	end
  end

  def destroy
  		@airport.destroy
  		redirect_to airports_path, notice: "Airport deleted"
  	end

    def update
      @airport.update(airport_params)
      redirect_to @airport, notice: "Aiport succesfully updated."
    end

  	private

  	def set_airport
  		@airport = Airport.find(params[:id])
  	end

  	def airport_params
  		params.require(:airport).permit(:name, :state).merge(post_id: current_post.id)
  	end
end
