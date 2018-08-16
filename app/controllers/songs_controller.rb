class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
  s = song_params
  song = Song.create(s)
  redirect_to song_path(song)
  end

  def edit
  end

  def update
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
