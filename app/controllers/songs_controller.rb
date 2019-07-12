class SongsController < ApplicationController
  before_action :load_album, only: :index
  before_action :load_song, only: :show

  def index
    @songs = @album.songs
    @artist = @album.artist

    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
    add_breadcrumb "Albums", "/albums?artist_id=#{@artist.id}"
    add_breadcrumb "Album #{@album.name}", "/albums/#{@album.id}"
    add_breadcrumb "Songs", "/songs?album_id=#{@album.id}"
  end

  def show
    @album = @song.album
    @artist = @album.artist

    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
    add_breadcrumb "Albums", "/albums?artist_id=#{@artist.id}"
    add_breadcrumb "Album #{@album.name}", "/albums/#{@album.id}"
    add_breadcrumb "Songs", "/songs?album_id=#{@album.id}"
    add_breadcrumb "Song #{@song.name}", :song_path
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
