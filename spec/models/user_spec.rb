require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should validate a fully qualified user' do 
    user = User.new({
      email: "email@fam.jcole",
      password: "12313123",
      password_confirmation: "12313123",
      first_name: "Jermaine",
      last_name: "Cole",
    })
  user.save    
  expect(user).to be_valid
  end

  it "password should match" do
    user = User.new({
      email: "email@fam.jcole",
      password: "12313123",
      password_confirmation: "not the same",
      first_name: "Jermaine",
      last_name: "Cole",
    })
  user.save    
  expect(user).to_not be_valid
  end

  it "email must be unique" do
    user = User.new({
      email: "email@fam.jcole",
      password: "12313123",
      password_confirmation: "not the same",
      first_name: "Jermaine",
      last_name: "Cole",
    }) 
    user.save  
end
