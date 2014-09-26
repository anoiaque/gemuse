require 'minitest/autorun'
require File.expand_path('../../lib/gemuse.rb', __FILE__)

def move_dummy_test
  orig = "#{Bundler.root}/tmp/dummy_test.txt"
  dest = "#{Bundler.root}/test/lib/gemuse/dummy_test.rb"
  File.rename(orig, dest)
  ret = yield
  File.rename(dest, orig)
  ret
end
