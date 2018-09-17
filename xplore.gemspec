$:.push File.expand_path("../lib", __FILE__)

require "rails_db/version"

Gem::Specification.new do |s|
  s.name        = "xplore"
  s.version     = RailsDb::VERSION::STRING
  s.authors     = ["Igor Kasyanchuk", "Irfan Ahmed"]
  s.email       = ["igorkasyanchuk@gmail.com", "irfandhk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/rails_db"
  s.summary     = "Inspect and explore your data witht his easy, handy system."
  s.description = "Quick way to inspect your Rails database, see content of tables, filter, export them to CSV, Excel, EXPLAIN SQL and run SQL queries."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib,test}/**/*", "rails_db.gemspec", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.rdoc", "bin/rails_db", "bin/railsdb", "bin/runsql"]
  s.test_files = Dir["test/**/*"]

  s.executables   = ["railsdb", "xplore", 'runsql']

  s.add_dependency 'rails', ">= 5.0.0"
  s.add_dependency 'codemirror-rails'
  s.add_dependency 'terminal-table'
  s.add_dependency 'simple_form'
  s.add_dependency 'ransack'
  s.add_dependency 'kaminari'

  s.add_development_dependency "launchy"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2", '<= 0.3.20'
  s.add_development_dependency "pg"
  s.add_development_dependency "axlsx_rails"
  s.add_development_dependency 'will_paginate', '~> 3.0.6'
  s.add_development_dependency 'mime-types', '< 3.0'
  s.add_development_dependency 'paranoia'
  s.add_development_dependency 'pry-rails'
end
