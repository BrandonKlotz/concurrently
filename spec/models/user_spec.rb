require 'spec_helper'

describe User do

  describe "#validate_username" do
    initial_user = User.create!(username: Faker::Internet.unique.username(5..8), email: Faker::Internet.email, password: Faker::Internet.password)

    context "unique username" do
      it do 
        user = User.new(username: Faker::Internet.unique.username(5..8), email: Faker::Internet.email, password: Faker::Internet.password)
        user.save

        expect(user.errors).to_not be_present
      end
    end

    context "duplicate username" do
      it do 
        user = initial_user.dup
        user.save

        expect(user.errors).to be_present
        expect(user.errors[:username].first).to eq("has already been taken")
      end
    end
  end

  describe '#find_for_database_authentication' do

  end
end
