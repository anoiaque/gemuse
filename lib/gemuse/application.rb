module Gemuse
  class Application
    FOLDERS = ["app", "lib", "test", "config", "bin"]
    FILES = ["./Rakefile"]
    CONSTANT_REGEXP = /\s?([[:upper:]][[[:alnum:]]:]+)[\s|\.|$]+/
    
    def constants
      @constants ||= begin
        constants = []
        FOLDERS.each do |folder|
          Dir.glob("#{Bundler.root}/#{folder}/**/*.{rb,rake}").each do |file|
            constants += constants_in_file(file)
          end
        end
        FILES.each do |file|
          constants += constants_in_file("#{Bundler.root}/#{file}")
        end
        constants.flatten.compact.uniq
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