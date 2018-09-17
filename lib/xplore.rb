require_relative 'rails_db'

if Object.constants.include?(:Terminal) && Terminal.class == Module
  puts "A terminal module is found, removing ....."
  
  Object.send(:remove_const, :Terminal)
end

Xplore = RailsDb