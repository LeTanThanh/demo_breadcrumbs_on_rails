class SongsController < ApplicationController
  before_action :load_album, only: :index
  before_action :load_song, only: :show

  before_action :add_breadcrumb_artists
  before_action :add_breadcrumb_albums
  before_action :add_breadcrumb_album
  before_action :add_breadcrumb_songs
  before_action :add_breadcrumb_song, only: :show

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

  def add_breadcrumb_artists
    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
  end

  def add_breadcrumb_albums
    add_breadcrumb "Albums", "/albums?artist_id=#{@artist.id}"
  end

  def add_breadcrumb_album
    add_breadcrumb "Album #{@album.name}", "/albums/#{@album.id}"
  end

  def add_breadcrumb_songs
    add_breadcrumb "Songs", "/songs?album_id=#{@album.id}"
  end

  def add_breadcrumb_song
    add_breadcrumb "Song #{@song.name}", :song_path
  end
end
