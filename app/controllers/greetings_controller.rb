# Class: GreetingsController
class GreetingsController < ApplicationController
  # GET /greetings
  def index
    @greetings = Greeting.all.shuffle

    render json: @greetings
  end

  # GET /greetings/1
  def show
    render json: @greeting
  end

  # POST /greetings
  def create
    @greeting = Greeting.new(greeting_params)

    if @greeting.save
      render json: @greeting, status: :created, location: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def greeting_params
    params.require(:greeting).permit(:msg)
  end
end
