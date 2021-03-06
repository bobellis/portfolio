require 'rails_helper'

describe "the add a project process" do
  it "adds a new project to a skill" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_on 'New Skill'
    fill_in 'Name', :with => 'PHP'
    click_on 'Create Skill'
    click_on 'PHP'
    click_on 'Add Project'
    fill_in 'Name', :with => 'Test Project'
    click_on 'Create Project'
    expect(page).to have_content 'projects'
  end

  it "gives error when no name is entered" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    click_on 'New Skill'
    fill_in 'Name', :with => 'PHP'
    click_on 'Create Skill'
    click_on 'PHP'
    click_on 'Add Project'
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
