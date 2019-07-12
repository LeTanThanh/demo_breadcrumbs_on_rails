class ArtistsController < ApplicationController
  before_action :load_artist, only: :show

  def index
    @artists = Artist.all
  end

  def show
    add_breadcrumb "Artist #{@artist.name}", :artist_path
  end

  private

  def load_artist
    @artist = Artist.find_by id: params[:id]

    redirect_to root_url unless @artist
  end
end
