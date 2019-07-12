module AddBreadcrumbHelper extend ActiveSupport::Concern
  included do
    before_action :add_breadcrumb_root_path
  end

  def add_breadcrumb_root_path
    add_breadcrumb "Home", :root_path
  end

  def add_breadcrumb_artist_path
    add_breadcrumb "Artist #{@artist.name}", "/artists/#{@artist.id}"
  end

  def add_breadcrumb_albums_path
    add_breadcrumb "Albums", "/albums?artist_id=#{@artist.id}"
  end

  def add_breadcrumb_album_path
    add_breadcrumb "Album #{@album.name}", "/albums/#{@album.id}"
  end

  def add_breadcrumb_songs_path
    add_breadcrumb "Songs", "/songs?album_id=#{@album.id}"
  end

  def add_breadcrumb_song_path
    add_breadcrumb "Song #{@song.name}", "/songs/#{@song.id}"
  end
end
