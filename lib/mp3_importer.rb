require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{@path}/*"]
    files.each do |file|
      file.slice!("#{@path}/")
    end
    files
  end

  def import
    files.each do |file|
      artist_name = file.split(" - ")[0]
      song_name = file.split(" - ")[1]
      artist = Artist.find_or_create_by_name(artist_name)
      artist.songs << Song.new_by_filename(file)

      # if Artist.all.find {|artist| artist.name == name}

    end

    # artists = files.collect {|filename| filename.split(" - ")[0]}
    # artists.each do |name|
    #   if !Artist.all.find {|artist| artist.name == name}
    #     artist = Artist.find_or_create_by_name(name).save
    #   end
    # end
    #
    # songs = files.collect {|filename| filename.split(" - ")[1]}
  end
end
