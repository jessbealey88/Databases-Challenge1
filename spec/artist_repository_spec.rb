require 'artist_repository'

def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  describe ArtistRepository do
    before(:each) do 
      reset_artists_table
    end

    it 'returns the list of artists' do
        repo = ArtistRepository.new
        artists = repo.all

        artists.length # =>  2
        
        artists[0].id # =>  1
        artists[0].name # =>  'Pixies'
        artists[0].genre # =>  'Rock'
        
        artists[1].id # =>  2
        artists[1].name # =>  'ABBA'
        artists[1].genre # =>  'Pop'

    end
    
  end