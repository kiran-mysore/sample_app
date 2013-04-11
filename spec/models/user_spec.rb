require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  pending "it should be a test"

  before{
  	@user = User.new(name: "Tony", email: "tony@gmail.com")

  }

  subject{@user}
  it{should respond_to(:name)}
  it{should respond_to(:email)}
  it{should be_valid}

describe "When name is not present" do

	before {
		@user.name = " "

	}

	it{should_not be_valid}
  end	

describe "When email is not present" do

	before {
		@user.email = " "

	}

	it{should_not be_valid}
  end	

  describe "When name is too long" do

	before {
		@user.name = "a" * 51

	}

	it{should_not be_valid}
  end	


  describe "when email format is not valid" do

	it "should be invalid" do
		addresses = %w[user@foo,com user_at_foo.com example.user@foo.]
		addresses.each do |adddress|
			@user.email = adddress
			@user.should_not be_valid
		end
	end	
  end 

    describe "when email format is valid" do

	it "should be valid" do
		addresses = %w[user@foo.com A_B@foo.com a+v@foo.cn]
		addresses.each do |valid_adddress|
			@user.email = valid_adddress
			@user.should be_valid
		end
	end	
  end 
end
