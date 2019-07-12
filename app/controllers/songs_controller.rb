class SongsController < ApplicationController
  before_action :load_album, only: :index

  def index
    @songs = @album.songs
    @artist = @album.artist
  end

  private

  def load_album
    @album = Album.find_by id: params[:album_id]

    redirect_back(fallback_location: root_url) unless @album
  end
end
