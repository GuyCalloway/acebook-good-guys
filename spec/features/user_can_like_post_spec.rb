require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Liking Posts', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end
  describe 'A User' do
    scenario 'Can like comment in posts show' do
      create_post
      click_link 'See Post'
      click_button 'Like'
      click_link "Back"
      expect(page).to have_content('1 Like')
    end

      scenario 'can unlike a previously liked post' do
        create_post
        click_link 'See Post'
        click_button 'Like'
        click_link "Back"
        click_link 'See Post'
        click_button 'Unlike'
        click_link "Back"
        expect(page).to have_content('0 Likes')
      end
    end
  
end