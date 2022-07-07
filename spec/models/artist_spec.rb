require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should have_many :songs }

  describe 'instance methods' do
    describe '#average_song_length' do
      it 'returns the average sonf length' do
        prince = Artist.create!(name: 'Prince')
        purple = prince.songs.create!(title: 'Purple Rain', length: 456, play_count: 4567)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 458, play_count: 456)
        corvette = prince.songs.create!(title: 'Red Corvette', length: 650, play_count: 456)
        
      expect(prince.average_song_length.round(2)).to eq(521.33)
      end
    end
  end
end