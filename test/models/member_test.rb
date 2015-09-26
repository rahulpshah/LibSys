require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
    @member = Member.new(name: "ExampleUser", email: "user231@example.com", password: "member123")
  end
  
  test "should be valid" do
  assert @member.valid?
  end
  
   test "name should be present" do
    @member.name = " "
    assert_not @member.valid?
  end

  test "email should be present" do
    @member.email = "     "
    assert_not @member.valid?
  end
 
   test "password should be present" do
    @member.password = "     "
    assert_not @member.valid?
   end
	
  test "name should not be too long" do
  @member.name="sdfmdmvfdvfvvffkmlfvlfdsnkdkfrjfrfbjdbfdnfkcdffhhkjhkjjnjknjnjnbdfdcfcgvhbnknjnkkkjnnhvcxdxxdfvbbvvhgcdesxecgvvgvfcfcfffcfcnkcndnfedfdjfvdnkfcvdkvmcdkl"
  assert_not @member.valid?
  end
 
  test "email should not be too long" do
  @member.email="sdfmdmvfdvfvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdnfkcdnkcndnfedfdjfvdnkfcvdkvmcdkl@example.com"
  assert_not @member.valid?
  end 

  test "email should be unique" do
  @duplicate_member=@member.dup
  @member.save
  assert_not @duplicate_member.valid?
  end
  
  test "email should be unique and case insensitive" do
  @duplicate_member=@member.dup
  @duplicate_member.email=@member.email.upcase
  @member.save
  assert_not @duplicate_member.valid?
  end
end
