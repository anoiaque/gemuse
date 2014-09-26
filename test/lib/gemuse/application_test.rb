require_relative '../../test_helper'

describe Gemuse::Application do
  
  it "find all constants/namespace in current app, search in /app /lib /test and Rakefile" do
    constants = Gemuse::Application.new.constants

    assert_equal 13, constants.count
    assert !constants.include?('FactoryGirl')
    assert constants.include?('Rake::TestTask')
  end
  
  it "find constants of gem factory_girl when used using its main namespace" do
    constants = move_dummy_test { Gemuse::Application.new.constants }

    assert_equal 15, constants.count
    assert constants.include?('FactoryGirl')
  end
  
end
