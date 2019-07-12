class AlbumsController < ApplicationController
  before_action :load_artist

  def index
    @albums = @artist.albums
  end

  private

  def load_artist
    @artist = Artist.find_by id: params[:artist_id]

    redirect_to root_url unless @artist
  end
end
