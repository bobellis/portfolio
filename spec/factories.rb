FactoryGirl.define do

  factory(:user) do
    email('bob@msn.com')
    password('Password123')
    admin(true)
  end

end
