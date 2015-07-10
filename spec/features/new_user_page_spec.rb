require 'rails_helper'

describe "the new user process" do
  it "adds a new user" do
    visit '/'
    fill_in 'Email', :with => "david@aol.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_on 'Sign up'
    expect(page).to have_content 'Skills'
  end
end

describe "the login process" do
  it "logs in a user" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).to have_content 'Skills'
  end
end
