class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      flash[:error] = @movie.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_actors = @movie.actors
    @available_actors = Actor.all - @movie_actors
  end

  def destroy
  end

  def add_actor
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:actor_id])

    movie.actors.push(actor)

    render json: actor
  end

  private
  def movie_params
    params.require(:movie).permit!
  end
end
