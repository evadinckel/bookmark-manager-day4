require 'capybara/rspec'
require './app/models/link.rb'

feature "List of links on homepage" do
  scenario 'When i\'m visiting a home page I get a list of my links ' do
    Link.create(url: 'postgres://localhost/bookmark_manager_test', title: 'Links')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
    expect(page).to have_content ('Links')
    end
  end
end
