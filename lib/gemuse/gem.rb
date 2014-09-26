require 'bundler'

module Gemuse
  class Gem
    SPEC_VERSION_REGEXP = /\.version\s*=\s*([[:upper:]][[:alnum:]]+)::VERSION/
    
    attr_accessor :name, :path, :namespace
  
    def initialize
      yield self if block_given?
      resolve_namespace
    end
    
    def resolve_namespace
      @namespace = namespace_from_gemspec || namespace_from_lib
    end

    def self.all
      Bundler.definition.dependencies.map do |dep|
        spec = Bundler.definition.specs.detect { |spec| spec.name == dep.name }
        Gem.new do |gem|
          gem.name = dep.name
          gem.path = spec.full_gem_path
        end
      end
    end
    
    private
    
    def namespace_from_gemspec
      SPEC_VERSION_REGEXP.match(File.read(gemspec_file_path)).captures.first rescue nil
    end
    
    def namespace_from_lib
      pattern = name.gsub(/_|-/, '')
      Dir.glob(lib_paths).each do |file|
        c = /^[module|class]+\s+(#{pattern})/i.match(File.read(file)) and return c.captures.first
      end
      nil
    end
    
    def lib_paths
      ["#{path}/lib/**/*.rb"]
    end
    
    def gemspec_file_path
      Dir.glob("#{path}/*.gemspec").first
    end
    
  
  end
end