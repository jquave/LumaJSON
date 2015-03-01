Pod::Spec.new do |s|
  s.name = "LumaJSON"
  s.version = "0.0.1"
  s.summary = "LumaJSON is a simple wrapper for deserializing JSON"
  s.homepage = "https://github.com/jquave/LumaJSON"
  s.license = { :type => "MIT" }
  s.authors = { "jquave" => "jquave@gmail.com" }

  s.ios.deployment_target = "7.1"
  s.source = { :git => "https://github.com/jquave/LumaJSON/LumaJSON.git" }
  s.source_files = "*.swift"
end
