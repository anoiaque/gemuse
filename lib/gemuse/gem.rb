require 'bundler'

module Gemuse
  class Gem
    SPEC_VERSION_REGEXP = /\.version\s*=\s*([[:upper:]][[:alnum:]]+)::VERSION/
    MODULE_REQUIRE_REGEXP = /^[module|class]+\s+([[:upper:]][[:alnum:]]+)/
    
    attr_accessor :name, :path, :namespace
  
    def initialize
      yield self if block_given?
      resolve_namespace
    end
    
    def resolve_namespace
      @namespace = namespace_from_gemspec || namespace_from_requires
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
    
    def namespace_from_requires
      MODULE_REQUIRE_REGEXP.match(File.read(require_file_path)).captures.first rescue nil
    end
    
    def gemspec_file_path
      Dir.glob("#{path}/*.gemspec").first
    end
    
    def require_file_path
      Dir.glob("#{path}/lib/*.rb") do |f| 
        file_name = Pathname.new(f).basename.to_s
        return f if file_name =~ /#{name}/
      end
    end
  
  end
end