module CSSLint
  class Lint
    attr_reader :gem_vendor_dir
    attr_reader :args
    attr_reader :css
    attr_reader :options
    
    def initialize(*args)
      @gem_vendor_dir = File.join(File.dirname(__FILE__), 'vendor')
      if args.empty?
        @css = error_message
      else
        @args = []
        @css = []
        args.each do |arg|
          arg.start_with?("--") ? @args << arg : @css << arg
        end
      end
    end

    def execute(*compass_options)
      if @css == error_message
        puts @css
      else
        if !compass_options.empty?
          run_lint(*compass_options)
        else
          run_lint(@args)
        end
      end
    end

    def error_message
      'Must provide css_lint a CSS file or directory'
    end
    
    def get_java_path
      `which java`.to_s.rstrip
    end

    def run_lint(*options)
      java_path = get_java_path
      raise "You do not have a Java installed, but it is required." unless java_path && !java_path.empty?
      
      options.empty? ? @options = '' : @options = options.join(' ') + ' '

      if !@css.empty?
        @css.each do |item|
          system("java -jar #{@gem_vendor_dir}/js.jar #{@gem_vendor_dir}/csslint-rhino.js #{@options}#{item}")
        end
      else
        system("java -jar #{@gem_vendor_dir}/js.jar #{@gem_vendor_dir}/csslint-rhino.js #{@options}")
      end
    end
  end
end
