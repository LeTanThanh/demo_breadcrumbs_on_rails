class SongsController < ApplicationController
  before_action :load_album, only: :index
  before_action :load_song, only: :show

  def index
    @songs = @album.songs
    @artist = @album.artist
  end

  def show
    @album = @song.album
    @artist = @album.artist
  end

  private

  def load_album
    @album = Album.find_by id: params[:album_id]

    redirect_back(fallback_location: root_url) unless @album
  end

  def load_song
    @song = Song.find_by id: params[:id]

    redirect_back(fallback_location: root_url) unless @song
  end
end
