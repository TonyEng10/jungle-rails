require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(name: "tony", email: "t@t.com", password: "1234", first_name: "tony", last_name: "robert")
  end 
  describe 'Validations' do
    it "should check if user is valid" do
      expect(@user).to be_valid
    end

    it "should check if email is valid" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank", "Email Invalid email")
    end
    
    it "should check if first name is valid" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should check if last name is valid" do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should check if password is valid" do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is too short (minimum is 3 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
      it "should check if authenticate_with_credentials is valid" do
      expect(@user).to be_valid
    end
  end

end