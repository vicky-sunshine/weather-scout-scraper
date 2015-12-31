$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'weatherdesc/version'
Gem::Specification.new do |s|
  s.name = 'weatherscout'
  s.version = WeatherDesc::VERSION
  s.date = WeatherDesc::DATE
  s.executables << 'weatherscout'
  s.summary = 'Tell you the weather of Taiwan'
  s.description = 'You can find the weather of the major city in Taiwan'
  s.authors = ['Vicky Lee']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/vicky-sunshine/weather-scout-scraper'
  s.license     =  'MIT'

  # depend gem
  s.add_development_dependency 'minitest'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'thor'
end
