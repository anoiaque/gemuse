require_relative 'gem'
require_relative 'application'

module Gemuse
  class Base
    
    def initialize
    end
    
    def unused
      constants = Gemuse::Application.new.constants
      Gemuse::Gem.all.inject([]) do |unused, gem|
        next unused if constants.any? { |cs| cs =~ /^#{gem.namespace}$|^#{gem.namespace}::/ }
        unused << gem
      end
    end
    
  end
end
