require 'rails_helper'
Warden.test_mode!

describe 'ContactBooksController' do

  describe "shows the index page" do
    it "returns a list of contact books" do
      contact_book = FactoryGirl.create(:contact_book)
      login_as(contact_book.user, :scope => :user, :run_callbacks => false)
      visit root_url
      expect(page).to have_content("MyContactBook")
      Warden.test_reset!
    end
  end

  describe "visit the show page" do
    it "shows an individiual contact book" do
      contact_book = FactoryGirl.create(:contact_book)
      login_as(contact_book.user, :scope => :user, :run_callbacks => false)
      visit contact_book_path(contact_book)
      expect(page).to have_content("Add a new contact")
      Warden.test_reset!
    end
  end

  describe "new contact book creation path" do
    it "creates a new path" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user, :run_callbacks => false)
      visit new_contact_book_path
      fill_in :contact_book_name, with: "TestBook"
      click_button 'Create Contact book'
      expect(page).to have_content("TestBook")
      Warden.test_reset!
    end
  end
end
