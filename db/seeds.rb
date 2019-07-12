10.times do
  artist = Artist.create name: FFaker::Music.artist, description: FFaker::Lorem.sentence

  10.times do
    album = artist.albums.create name: FFaker::Music.album, description: FFaker::Lorem.sentence

    10.times do
      album.songs.create name: FFaker::Music.album, description: FFaker::Lorem.sentence,
        lyric: FFaker::Lorem.sentences.join("<br>")
    end
  end
end
