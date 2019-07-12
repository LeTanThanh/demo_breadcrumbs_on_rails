class AlbumsController < ApplicationController
  before_action :load_artist, only: :index
  before_action :load_album, only: :show

  def index
    @albums = @artist.albums
  end

  def show
    @artist = @album.artist
  end

  private

  def load_artist
    @artist = Artist.find_by id: params[:artist_id]

    redirect_to root_url unless @artist
  end

  def load_album
    @album = Album.find_by id: params[:id]

    redirect_back(fallback_location: root_url) unless @album
  end
end
