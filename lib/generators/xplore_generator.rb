class XploreGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def copy_initializer
    template 'xplore.rb', 'config/initializers/xplore.rb'
  end
end