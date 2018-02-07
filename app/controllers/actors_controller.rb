class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_path
    else
      flash[:error] = @actor.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def destroy
  end

  private
  def actor_params
    params.require(:actor).permit!
  end
end
