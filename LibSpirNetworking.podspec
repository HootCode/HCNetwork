#
# Be sure to run `pod lib lint LibSpirNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LibSpirNetworking"
  s.version          = "0.1.2"
  s.summary          = "AFNetworking + JSONModel + SPIR + <3 = SPNetworking"  
  s.description      = <<-DESC
                    SPNetworking is a mid-high level framework for dealing with
                    AFNetworking and JSONModel. It allows you to use POST, GET, DELETE and PUT request methods,
                    mock them and even add your own overlay on it.
                       DESC

  s.homepage         = "http://bitbucket.spir.fr/projects/PODS/repos/lib-spir-networking/browse/README.md"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "SPIR Communication Property", :file => "LICENSE" }
  s.author           = { "Julien Goudet" => "jgoudet@spir.fr" }
  s.source           = { :git => "http://bitbucket.spir.fr/scm/pods/lib-spir-networking.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jlngdt'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'AFNetworking'
  s.dependency 'JSONModel'
  s.dependency 'OHHTTPStubs'
  s.dependency 'FormatterKit'

end
