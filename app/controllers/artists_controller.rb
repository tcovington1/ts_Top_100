class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]
  def index
    @artists = Artist.all
  end

  def show

  end

  def new
    @artist = @song.artists.new
  end

  def create
    @artist = @song.artists.new(artist_params)
    if @artist.save
      redirect_to billboard_song_path(@song.billboard_id, @song)
    else
      render :new
    end
  end

  def edit
  end

  private 
    def set_artist
      @song = Song.find(params[:song_id])
    end

    def artist_params
      params.require(:artist).permit(:name, :age, :DOB, :birth_place)
    end
end
