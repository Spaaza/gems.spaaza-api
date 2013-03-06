require 'httpclient'

Dir[File.dirname(__FILE__) + '/api/methods/*.rb'].each { |file| require file  }
Dir[File.dirname(__FILE__) + '/api/*.rb'].each { |file| require file  }