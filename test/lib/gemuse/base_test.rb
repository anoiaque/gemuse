require_relative '../../test_helper'
require 'bundler'

describe Gemuse::Base do

  before do
    Bundler.require(:test)
  end
  
  it "must find unused gems" do
    unused = Gemuse::Base.new.unused

    assert_equal 2, unused.count
    assert_equal ["factory_girl", "twitter"], unused.map(&:name)
  end
  
  describe "when we use factory girl in a test" do
    it "should have 0 gems unused" do
      unused = move_dummy_test { Gemuse::Base.new.unused }
    
      assert_equal 0, unused.count
    end
end
  
end