require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'New Skill'
    fill_in 'Name', :with => 'PHP'
    click_on 'Create Skill'
    expect(page).to have_content 'Skills'
  end

  it "gives error when no name is entered" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
