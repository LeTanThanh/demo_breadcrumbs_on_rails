10.times do
  artist = Artist.create name: FFaker::Music.artist, description: FFaker::Lorem.sentence
end
