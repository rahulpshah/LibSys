require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @admin = Admin.new(name: "ExampleUser", email: "user231@example.com", password: "admin123")
  end
  
  test "should be valid" do
  assert @admin.valid?
  end
  
   test "name should be present" do
    @admin.name = " "
    assert_not @admin.valid?
  end

  test "email should be present" do
    @admin.email = "     "
    assert_not @admin.valid?
  end
 
   test "password should be present" do
    @admin.password = "     "
    assert_not @admin.valid?
   end
	
  test "name should not be too long" do
  @admin.name="sdfmdmvfdvfvvffkmlfvlfdsnkdkfrjfrfbjdbfdnfkcdnkcndnfedfdjfvdnkfcvdkvmcdkl"
  assert_not @admin.valid?
  end
 
  test "email should not be too long" do
  @admin.email="sdfmdmvfdvfvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdvvffkmlfvlfdsnkdkfrjfrfbjdbfdnfkcdnkcndnfedfdjfvdnkfcvdkvmcdkl@example.com"
  assert_not @admin.valid?
  end 

  test "email should be unique" do
  @duplicate_admin=@admin.dup
  @admin.save
  assert_not @duplicate_admin.valid?
  end
  
  test "email should be unique and case insensitive" do
  @duplicate_admin=@admin.dup
  @duplicate_admin.email=@admin.email.upcase
  @admin.save
  assert_not @duplicate_admin.valid?
  end
end
