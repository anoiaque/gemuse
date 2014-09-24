require_relative '../../test_helper'
require 'bundler'

describe Gemuse::Base do

  before do
    Bundler.require(:test)
  end
  
  it "must find unused gems" do
    unused = Gemuse::Base.new.unused
    
    assert_equal 1, unused.count
    assert_equal 'factory_girl', unused.first.name
  end
  
  describe "when we use factory girl in a test" do
    it "gems unused must  be zero" do
      unused = move_dummy_test { Gemuse::Base.new.unused }
    
      assert_equal 0, unused.count
    end
end
  
end