require 'rubygems'
require 'rspec/core/rake_task'

desc "Run Rspec tests."
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end

desc "Download csslint jar and js file from Github."
task :download_csslint do
  host_url = URI.parse("https://raw.github.com")
  dependencies = ['/stubbornella/csslint/master/lib/js.jar', '/stubbornella/csslint/master/release/csslint-rhino.js']

  require 'net/http'
  http = Net::HTTP.new(host_url.host, host_url.port)
  http.use_ssl = true
  http.ssl_version = :TLSv1
  http.start do |http|
    dependencies.each do |dependency|
      body = http.get(dependency).body
      file_name = File.basename(dependency)
      vendor_dir = "lib/vendor"
      mkdir(vendor_dir) unless File.directory? vendor_dir
      File.open("#{vendor_dir}/#{file_name}", "w") do |file|
        file.write(body)
      end
    end
  end
end

task :default => [:spec, :download_csslint]
