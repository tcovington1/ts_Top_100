class SongsController < ApplicationController
  before_action :set_sub
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def index
    @songs = @billboard.songs
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = @billboard.songs.new
  render partial: 'form'
  end

  def create
    # @topic = Topic.new(topic_params)
    @song = @billboard.songs.new(song_params)
    if @song.save
      redirect_to [@billboard, @song]
    else
      render :new
    end
  end

  def edit
    render partial: 'form'
  end
end

def update
  # @topic = Topic.find(params[:id])
  if @song.update(song_params)
        redirec_to [@billboard, @song]
      else
        render :edit
      end
end



def destroy
# @topic.find(params[:id]).destroy
@song.destroy
redirect_to billboard_song_path(@billboard)
end


private
  def song_params
        params.require(:song).permit(:title, :artist, :runtime, :top_100)
        # check scheme if you do'nt know 
      end

      def set_billboard
        @billboard = Billboard.find(params[:billboard_id])
      end

      def set_topic
        @song = Song.find(params[:id])
      end

    end
  end