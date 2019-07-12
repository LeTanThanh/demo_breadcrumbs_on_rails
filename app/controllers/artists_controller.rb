class ArtistsController < ApplicationController
  before_action :load_artist, only: :show
  before_action :add_breadcrumb_artist_path, only: :show

  def index
    @artists = Artist.all
  end

  def show
  end

  private

  def load_artist
    @artist = Artist.find_by id: params[:id]

    redirect_to root_url unless @artist
  end

  def add_breadcrumb_artist_path
    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
  end
end
