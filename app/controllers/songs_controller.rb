class SongsController < ApplicationController
  before_action :load_album, only: :index
  before_action :load_song, only: :show

  before_action :add_breadcrumb_artist_path
  before_action :add_breadcrumb_albums_path
  before_action :add_breadcrumb_album_path
  before_action :add_breadcrumb_songs_path
  before_action :add_breadcrumb_song_path, only: :show

  def index
    @songs = @album.songs
  end

  def show
  end

  private

  def load_album
    @album = Album.find_by id: params[:album_id]
    redirect_back(fallback_location: root_url) unless @album

    @artist = @album.artist
  end

  def load_song
    @song = Song.find_by id: params[:id]
    redirect_back(fallback_location: root_url) unless @song

    @album = @song.album
    @artist = @album.artist
  end
end
