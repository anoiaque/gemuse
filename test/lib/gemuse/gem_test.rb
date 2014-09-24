require_relative '../../test_helper'

describe Gemuse::Gem do
  
  it "get all gems of current app with their name, path and namespace" do
    gems = Gemuse::Gem.all

    gems.map(&:name).must_equal ["gemuse", "bundler", "rake", "factory_girl"]
    gems.map(&:namespace).must_equal ["Gemuse", "Bundler", "Rake", "FactoryGirl"]
  end
  
end