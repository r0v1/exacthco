# -*- encoding: utf-8 -*-
# stub: watir-webdriver 0.9.1 ruby lib

Gem::Specification.new do |s|
  s.name = "watir-webdriver"
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jari Bakken"]
  s.date = "2015-10-14"
  s.description = "WebDriver-backed Watir"
  s.email = ["jari.bakken@gmail.com"]
  s.homepage = "http://github.com/watir/watir-webdriver"
  s.licenses = ["MIT"]
  s.rubyforge_project = "watir-webdriver"
  s.rubygems_version = "2.4.6"
  s.summary = "Watir on WebDriver"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-webdriver>, [">= 2.46.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<yard>, ["> 0.8.2.1"])
      s.add_development_dependency(%q<webidl>, [">= 0.1.5"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<fuubar>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<yard-doctest>, ["~> 0.1.5"])
    else
      s.add_dependency(%q<selenium-webdriver>, [">= 2.46.2"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<yard>, ["> 0.8.2.1"])
      s.add_dependency(%q<webidl>, [">= 0.1.5"])
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<fuubar>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<yard-doctest>, ["~> 0.1.5"])
    end
  else
    s.add_dependency(%q<selenium-webdriver>, [">= 2.46.2"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<yard>, ["> 0.8.2.1"])
    s.add_dependency(%q<webidl>, [">= 0.1.5"])
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<fuubar>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<yard-doctest>, ["~> 0.1.5"])
  end
end
