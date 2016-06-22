#
# Be sure to run `pod lib lint HCNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HCNetwork"
  s.version          = "0.1.15"
  s.summary          = "AFNetworking + JSONModel + Hootcode + <3 = HCetwork"
  s.description      = <<-DESC
                    HCetworking is a mid-high level framework for dealing with
                    AFNetworking and JSONModel. It allows you to use POST, GET, DELETE and PUT request methods,
                    mock them and even add your own overlay on it.
                       DESC

  s.homepage         = "https://github.com/HootCode/HCNetwork"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "Julien GOUDET", :file => "LICENSE" }
  s.author           = { "Julien Goudet" => "juliengdt@icloud.com" }
  s.source           = { :git => "https://github.com/HootCode/HCNetwork", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jlngdt'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.prefix_header_contents = '#define NEEDSTUB [[[NSBundle mainBundle] infoDictionary] valueForKey:@"Stub"]'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'AFNetworking', '~>2.0'
  s.dependency 'JSONModel'
  s.dependency 'OHHTTPStubs'
  s.dependency 'FormatterKit'

end
