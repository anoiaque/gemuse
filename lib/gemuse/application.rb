module Gemuse
  class Application
    CONSTANT_REGEXP = /\s?([[:upper:]][[[:alnum:]]:]+)[\s|\.|$]+/
    
    def constants
      @constants ||= begin
        Dir.glob(["#{Bundler.root}/**/*.{rb,rake}", "#{Bundler.root}/Rakefile"]).map do |file|
          constants_in_file(file)
        end.flatten.compact.uniq
      end
    end
    
    private
    
    def constants_in_file file
      constants = []
      open(file) do |f| 
        f.each_line do |line|  
          constants += line.scan(CONSTANT_REGEXP)
        end
      end
      constants
    end

  end
end