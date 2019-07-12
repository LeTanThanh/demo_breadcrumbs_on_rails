10.times do
  artist = Artist.create name: FFaker::Music.artist, description: FFaker::Lorem.sentence

  10.times do
    artist.albums.create name: FFaker::Music.album, description: FFaker::Lorem.sentence
  end
end
