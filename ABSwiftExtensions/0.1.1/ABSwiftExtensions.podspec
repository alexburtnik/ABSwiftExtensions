Pod::Spec.new do |s|
  s.name             = 'ABSwiftExtensions'
  s.version          = '0.1.1'
  s.summary          = 'UIKit and Foundation extensions'
 
  s.description      = <<-DESC
  Extensions to make developers\' life easier
                       DESC
 
  s.homepage         = 'https://github.com/alexburtnik/ABSwiftExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "alexburtnik" => "alexburtnik@gmail.com" }
  s.source           = { :git => 'https://github.com/alexburtnik/ABSwiftExtensions.git', :tag => "#{s.version}" }
 
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/**/*'
 
end