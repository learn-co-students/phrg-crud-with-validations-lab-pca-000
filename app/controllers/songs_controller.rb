# frozen_string_literal:true

class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params(:title, :artist_name, :genre, :released, :release_year))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(post_params(:title, :artist_name, :genre, :released))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  def post_params(*args)
    params.require(:song).permit(*args)
  end
end
