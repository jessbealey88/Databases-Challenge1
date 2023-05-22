require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library_test')

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
    p "#{artist.id} - #{artist.name} - #{artist.genre}"
end