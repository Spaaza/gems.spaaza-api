$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "spaaza-api"
  s.version = "1.6.2"
  s.platform     = Gem::Platform::RUBY  
  s.summary      = "SPAAZA eCommerce API"
  s.description  = "Ruby API for the SPAAZA MyPrice, ProductFinder, and Venster platforms"
  s.author       = 'SPAAZA'
  s.email        = 'info@spaaza.com'
  s.homepage     = 'http://www.spaaza.com'  
  s.require_path = 'lib'
  s.required_rubygems_version = ">= 1.8.x"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}

  s.add_dependency "httpclient"
end
