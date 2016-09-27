require 'rails_helper'
Warden.test_mode!

describe "ContactsController" do

  describe "show path" do
    it "returns details of a contact" do
      contact = FactoryGirl.create(:contact)
      login_as(contact.contact_book.user, :scope => :user, :run_callbacks => false)
      visit contact_book_contact_path(contact.contact_book, contact)
      expect(page).to have_content(contact.name)
    end
  end

  describe "contact creation" do
    it "create a new contact" do
      contact_book = FactoryGirl.create(:contact_book)
      login_as(contact_book.user, :scope => :user, :run_callbacks => false)
      visit new_contact_book_contact_path(contact_book)
      fill_in "Name", with: Faker::Name.name
      phone_num = "#{Faker::PhoneNumber.area_code}#{Faker::PhoneNumber.exchange_code}#{Faker::PhoneNumber.subscriber_number}"
      fill_in "Phone", with: phone_num
      click_button
      expect(page).to have_content(phone_num)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      contact = FactoryGirl.create(:contact)
      login_as(contact.contact_book.user, :scope => :user, :run_callbacks => false)
      visit contact_book_contact_path(contact.contact_book, contact)
      new_name = Faker::Name.name
      fill_in "Name", with: new_name
      phone_num = "#{Faker::PhoneNumber.area_code}#{Faker::PhoneNumber.exchange_code}#{Faker::PhoneNumber.subscriber_number}"
      fill_in "Phone", with: phone_num
      click_button "Update Contact"
      expect(page).to have_content(new_name)
      visit contact_book_path(contact.contact_book)
      expect(page).to have_content(phone_num)
    end
  end

end
