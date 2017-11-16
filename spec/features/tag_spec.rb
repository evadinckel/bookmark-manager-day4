


feature 'add the tags' do
  scenario "the user can add a tag to a link in the bookmark manager" do
    visit ('/links')
    visit ('/links/new')
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'Search'
    click_on('Submit')

    expect(Link.all.tags.map(&:name)).to include('Search')


  end


end
