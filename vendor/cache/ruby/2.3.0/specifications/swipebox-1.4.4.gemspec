# -*- encoding: utf-8 -*-
# stub: swipebox 1.4.4 ruby lib

Gem::Specification.new do |s|
  s.name = "swipebox".freeze
  s.version = "1.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Miha Rekar".freeze]
  s.date = "2016-09-22"
  s.description = "Swipebox | A touchable lightbox for the Rails asset pipeline.".freeze
  s.email = ["info@mr.si".freeze]
  s.homepage = "https://github.com/mrfoto/swipebox".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Wrapper for Swipebox by @brutaldesign".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, ["< 6.0", ">= 3.1"])
      s.add_runtime_dependency(%q<sass-rails>.freeze, ["< 6.0", ">= 3.1"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2"])
    else
      s.add_dependency(%q<rails>.freeze, ["< 6.0", ">= 3.1"])
      s.add_dependency(%q<sass-rails>.freeze, ["< 6.0", ">= 3.1"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2"])
    end
  else
    s.add_dependency(%q<rails>.freeze, ["< 6.0", ">= 3.1"])
    s.add_dependency(%q<sass-rails>.freeze, ["< 6.0", ">= 3.1"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2"])
  end
end
