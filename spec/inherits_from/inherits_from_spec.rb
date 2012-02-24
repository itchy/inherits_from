require 'spec_helper'

class User 
  attr_accessor :user_field
  def initialize
    self.user_field = "User Field"
  end
end 

class Profile
  include InheritsFrom
  # rewrite inherits_from to not use belongs_to
  def self.inherits_from(inheriter, args={})
    inherited_methods(inheriter)
    inherited_save(inheriter)
    inherited_respond_to(inheriter)
  end
  attr_accessor :profile_field, :user
  inherits_from :user
  
  def initialize
    self.user = User.new
    self.profile_field = "Profile Field"
  end
end


describe Profile do 
  before(:each) do
    @p = Profile.new
  end  
  
  it "should have inherits_from, inherited_methods, inherited_save & inherited_respond_to methods" do
    Profile.methods.include?(:inherits_from).should be_true
    Profile.private_methods.include?(:inherited_methods).should be_true
    Profile.private_methods.include?(:inherited_save).should be_true
    Profile.private_methods.include?(:inherited_respond_to).should be_true
  end  
  
  it "should be able to access methods in user from profile" do
    @p.user_field.should == "User Field"
  end
  
  it "should be able to access update methods in user from profile" do
    @p.user_field = "Test Set User Field"
    @p.user_field.should == "Test Set User Field"
  end
  
  it "should set user.tainted? to true when user attribute is set" do
    @p.user.tainted?.should be_false
    @p.user_field = "Test Set User Field"
    @p.user.tainted?.should be_true
  end
  
end