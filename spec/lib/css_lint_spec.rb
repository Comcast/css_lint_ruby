require 'spec_helper'

describe CSSLint do
  describe "Lint" do
    describe "#new" do
      context "it is provided a valid argument" do
        before(:each) do
          File.stub!(:join).and_return('/some_fake_dir')
          @cl = CSSLint::Lint.new 'foo'
        end

        it "creates an instance of CSSLint::Lint if it's passed an argument" do
          @cl.instance_of?(CSSLint::Lint).should == true
        end

        it "sets the value of :css to an array of css sources passed to the csslint command, relative to the current working directory" do
          @cl.css.class == Array
          @cl.css.should == ['foo']
        end

        it "sets the value of :gem_vendor_dir" do
          @cl.gem_vendor_dir.should == '/some_fake_dir'
        end
      end
      
      context "it is not provided a valid argument" do
        before(:each) do
          @cl = CSSLint::Lint.new
        end
        
        it "does not fail if no argument is provided" do
          @cl.instance_of?(CSSLint::Lint).should == true
        end

        it "sets the value of :css to the value of the error_message method" do
          @cl.css.should == @cl.error_message
        end
      end
    end
    
    describe "#error_message" do
      it "returns the string 'Must provide css_lint a CSS file or directory'" do
        @cl = CSSLint::Lint.new
        @cl.error_message.should == "Must provide css_lint a CSS file or directory"
      end
    end
    
    describe "#execute" do
      context "Lint is not instantiated with a valid argument" do
        it "prints the value of :css, which should be the value of error_message" do
          @cl = CSSLint::Lint.new
          $stdout.should_receive(:puts).with(@cl.error_message)
          @cl.execute
        end
      end

      context "Lint is instantiated with a valid argument" do
        it "calls run_lint" do
          @cl = CSSLint::Lint.new 'foo'
          @cl.stub!(:run_lint)
          @cl.should_receive(:run_lint)
          @cl.execute
        end
      end
    end

    describe "#get_java_path" do
      it "calls system(which java)" do
        @cl = CSSLint::Lint.new 'foo'
        @cl.should_receive(:'`').with("which java")
        @cl.get_java_path
      end
    end
    
    describe "#run_lint" do
      context "the user does not have java installed" do
        it "raises 'You do not have a Java installed, but it is required.'" do
          @cl = CSSLint::Lint.new 'foo'
          @cl.stub!(:get_java_path).and_return(false)
          @cl.should_receive(:get_java_path)
          lambda{@cl.run_lint}.should raise_exception
        end
      end

      context "the user has java installed" do
        it "lints the value of :css" do
          File.stub!(:join).and_return('/fake_vendor_dir')
          @cl = CSSLint::Lint.new 'foo'
          @cl.stub!(:get_java_path).and_return('java installed')
          @cl.should_receive(:get_java_path)
          @cl.should_receive("system").with("java -jar /fake_vendor_dir/js.jar /fake_vendor_dir/csslint-rhino.js foo")
          @cl.run_lint
        end

        it "Executes the command to return the version of CSS Lint if --version is passed as an option" do
          File.stub!(:join).and_return('/fake_vendor_dir')
          @cl = CSSLint::Lint.new '--version'
          @cl.stub!(:get_java_path).and_return('java installed')
          @cl.should_receive(:get_java_path)
          @cl.should_receive("system").with("java -jar /fake_vendor_dir/js.jar /fake_vendor_dir/csslint-rhino.js --version ")
          @cl.execute('--version')
        end

      end
    end
  end
end 
