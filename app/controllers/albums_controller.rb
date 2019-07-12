class AlbumsController < ApplicationController
  before_action :load_artist, only: :index
  before_action :load_album, only: :show

  before_action :add_breadcrumb_artist_path
  before_action :add_breadcrumb_albums_path
  before_action :add_breadcrumb_album_path, only: :show

  def index
    @albums = @artist.albums
  end

  def show
  end

  private

  def load_artist
    @artist = Artist.find_by id: params[:artist_id]

    redirect_to root_url unless @artist
  end

  def load_album
    @album = Album.find_by id: params[:id]
    redirect_back(fallback_location: root_url) unless @album

    @artist = @album.artist
  end

  def add_breadcrumb_artist_path
    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
  end

  def add_breadcrumb_albums_path
    add_breadcrumb "Albums", "/albums?artist_id=#{@artist.id}"
  end

  def add_breadcrumb_album_path
    add_breadcrumb "Album #{@album.name}", :album_path
  end
end
