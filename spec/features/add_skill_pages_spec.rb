require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_on 'New Skill'
    fill_in 'Name', :with => 'PHP'
    click_button 'Create Skill'
    expect(page).to have_content 'Skills'
  end

  it "gives error when no name is entered" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_on 'New Skill'
    click_button 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
