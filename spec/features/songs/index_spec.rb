require 'rails_helper'

RSpec.describe 'Artists songs index' do
  it 'shows all of titles of the songs of the artist' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 456, play_count: 4567)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 457, play_count: 456)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it 'links to each songs show page' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 456, play_count: 4567)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 457, play_count: 456)
    
    visit "/artists/#{prince.id}/songs"

    click_on purple.title

    expect(current_path).to eq("/songs/#{purple.id}")
  end

  it 'shows the average song length for the artist' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 456, play_count: 4567)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 458, play_count: 456)
    corvette = prince.songs.create!(title: 'Red Corvette', length: 650, play_count: 456)

    visit "/artists/#{prince.id}/songs"
    
    expect(page).to have_content("Average Song Length for Prince: 521.33")
  end
end