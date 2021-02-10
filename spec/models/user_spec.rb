require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "must be created with password & password_confirmation fields" do
      user = User.create( first_name: "first", last_name: "last", email: "email", password: "pass1", password_confirmation: "nil")
      expect(user.save).to be false
    end
    it "must have a unique email" do
      user1 = User.create( first_name: "first", last_name: "last", email: "email@email.com", password: "pass1", password_confirmation: "pass1")
      user2 = User.create( first_name: "first", last_name: "last", email: "Email@email.com", password: "pass1", password_confirmation: "pass1")
      expect(user2).to be_invalid
    end
    it "must have first_name" do
      user = User.create( first_name: nil, last_name: "last", email: "Email@email.com", password: "pass1", password_confirmation: "pass1" )
      expect(user).to be_invalid
    end
    it "must have last_name" do
      user = User.create( first_name: "first", last_name: nil, email: "Email@email.com", password: "pass1", password_confirmation: "pass1" )
      expect(user).to be_invalid
    end
    it "must have email" do
      user = User.create( first_name: "first", last_name: "last", email: nil, password: "pass1", password_confirmation: "pass1" )
      expect(user).to be_invalid
    end
    it "must have a password 5 chars long" do
      user = User.create( first_name: "first", last_name: "last", email: "Email@email.com", password: "pass", password_confirmation: "pass" )
      expect(user).to be_invalid
    end
    it "saves with all info correct" do
      user = User.create( first_name: "first", last_name: "last", email: "Email@email.com", password: "pass1", password_confirmation: "pass1" )
      expect(user.save!).to be true
    end
  end
  describe ".authenticate_with_credentials" do
    it "should fail with wrong password" do
      user1 = User.create( first_name: "first", last_name: "last", email: "Email@email.com", password: "pass1", password_confirmation: "pass1" )
      user1.save
      user2 = User.authenticate_with_credentials("Email@email.com", "pass2")
      expect(user2).to be nil
    end
    it "should allow spaces before email" do
      user1 = User.create( first_name: "first", last_name: "last", email: "email@email.com", password: "pass1", password_confirmation: "pass1" )
      user1.save
      user2 = User.authenticate_with_credentials(" email@email.com", "pass1")
      expect(user2).to be_truthy
    end
    it "email should be case in-sensititve" do
      user1 = User.create( first_name: "first", last_name: "last", email: "email@email.com", password: "pass1", password_confirmation: "pass1" )
      user1.save
      user2 = User.authenticate_with_credentials("Email@email.com", "pass1")
      expect(user2).to be_truthy
    end

  end
end
