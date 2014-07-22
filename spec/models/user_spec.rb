require_relative("../spec_helper")

describe "User" do
  # before do
  # end

  context "validation" do
    it "requires a first name" do
      u = User.new(:first_name => "")
      u.valid?
      expect(u.errors[:first_name].any?).to be_true
    end

    it "requires a last name" do
      u = User.new(:last_name => "")
      u.valid?
      expect(u.errors[:last_name].any?).to be_true
    end

    it "requires a valid email" do
      u = User.new(:email => "gorb@cincoboy")
      u.valid?
      expect(u.errors[:email].any?).to be_true
    end

    it "requires a valid zip" do
      u = User.new(:zip => "333")
      u.valid?
      expect(u.errors[:zip].any?).to be_true
    end

    it "requires a valid report detail" do
      u = User.new(:report_detail => "")
      u.valid?
      expect(u.errors[:report_detail].any?).to be_true
    end

    it "accepts a valid email"
    it "accepts a valid zip"
    it "accepts any report detail in the list"
    it "is valid with example attributes"
    
  end
end
