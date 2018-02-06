require 'rails_helper'

RSpec.describe Memo, type: :model do
  subject {
    User.new(name: "Erik", email: "erik@test.com")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      memo = Memo.new(
        title: "My test memo",
        text_body: "Test body",
        date: DateTime.now.utc,
        user: subject
      )
      expect(memo).to be_valid
    end

    it "is invalid without a title" do
      bad_memo = Memo.new(
        title: nil,
        text_body: "Test body",
        date: DateTime.now.utc,
        user: subject
      )
      expect(bad_memo).to_not be_valid
    end

    it "is invalid without a text body" do
      bad_memo = Memo.new(
        title: "My test memo",
        text_body: nil,
        date: DateTime.now.utc,
        user: subject
      )
      expect(bad_memo).to_not be_valid
    end

    it "is invalid without a date" do
      bad_memo = Memo.new(
        title: "My test memo",
        text_body: "Test body",
        date: nil,
        user: subject
      )
      expect(bad_memo).to_not be_valid
    end

    it "is invalid witout a user" do
      bad_memo = Memo.new(
        title: "My test memo",
        text_body: "Test body",
        date: DateTime.now.utc,
        user: nil
      )
      expect(bad_memo).to_not be_valid
    end
  end

  describe "Associations" do
    it "should have one user" do
      assoc = Memo.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
