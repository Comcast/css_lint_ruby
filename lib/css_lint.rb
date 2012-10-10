module CSSLint
  class Lint
    attr_reader :gem_vendor_dir
    attr_reader :css
    
    def initialize(*css_directories)
      @gem_vendor_dir = File.join(File.dirname(__FILE__), 'vendor')
      css_directories.empty? ? @css = error_message : @css = css_directories
    end

    def execute
      if @css == error_message
        puts @css
      else
        run_lint
      end
    end

    def error_message
      'Must provide csslint a CSS file or directory'
    end

    # NOTE: not currently used but left in for now
    # def download_csslint
    #  `curl -O https://raw.github.com/stubbornella/csslint/master/lib/js.jar > #{@gem_vendor_dir}/js.jar`
    #  `curl -O https://raw.github.com/stubbornella/csslint/master/release/csslint-rhino.js > #{@gem_vendor_dir}/csslint-rhino.js`
    # end
    
    def get_java_path
      `which java`.to_s.rstrip
    end

    def run_lint
      java_path = get_java_path
      raise "You do not have a Java installed, but it is required." unless java_path && !java_path.empty?
      
      @css.each do |item|
        system("java -jar #{@gem_vendor_dir}/js.jar #{@gem_vendor_dir}/csslint-rhino.js $@ #{item}")
      end
    end
  end
end
