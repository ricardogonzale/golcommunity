$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "engine_mensajes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "engine_mensajes"
  s.version     = EngineMensajes::VERSION
  s.authors     = ["Daniel Guevara"]
  s.email       = ["daniel.guevara@golcommunity.com"]
  s.homepage    = "https://www.golcommunity.com"
  s.summary     = "MotorMensaje: Summary of EngineMensajes."
  s.description = "MotorMensaje: Description of EngineMensajes."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

end
