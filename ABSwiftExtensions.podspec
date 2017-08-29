Pod::Spec.new do |s|
  s.name             = 'ABSwiftExtensions'
  s.version          = '0.1.0'
  s.summary          = 'Extensions to make developers\' life easier'
 
  s.description      = <<-DESC
UIKit and Foundation extensions
                       DESC
 
  s.homepage         = 'https://github.com/alexburtnik/ABSwiftExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexburtnik' => 'alexburtnik@gmail.com' }
  s.source           = { :git => 'https://github.com/alexburtnik/ABSwiftExtensions.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = '*.swift'
 
end