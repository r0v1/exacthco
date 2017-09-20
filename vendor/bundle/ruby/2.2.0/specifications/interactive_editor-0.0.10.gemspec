# -*- encoding: utf-8 -*-
# stub: interactive_editor 0.0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "interactive_editor"
  s.version = "0.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jan Berkel"]
  s.date = "2011-09-06"
  s.description = "Use vim (or any other text editor) from inside irb to quickly test & write new code."
  s.email = "jan.berkel@gmail.com"
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/jberkel/interactive_editor"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "interactive_editor"
  s.rubygems_version = "2.4.6"
  s.summary = "Interactive editing in irb."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spoon>, [">= 0.0.1"])
    else
      s.add_dependency(%q<spoon>, [">= 0.0.1"])
    end
  else
    s.add_dependency(%q<spoon>, [">= 0.0.1"])
  end
end
