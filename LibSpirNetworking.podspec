#
# Be sure to run `pod lib lint LibSpirNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LibSpirNetworking"
  s.version          = "0.1.0"
  s.summary          = "AFNetworking + JSONModel + SPIR + <3 = SPNetworking"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                    SPNetworking is a mid-high level framework for dealing with
                    AFNetworking and JSONModel. It allows you to use POST, GET, DELETE and PUT request methods,
                    mock them and even add your own overlay on it.
                       DESC

  s.homepage         = "http://bitbucket.spir.fr/projects/PODS/repos/lib-spir-networking/README.md"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => "SPIR Communication Property", :file => "LICENSE" }
  s.author           = { "Julien Goudet" => "jgoudet@spir.fr" }
  s.source           = { :git => "http://bitbucket.spir.fr/scm/pods/lib-spir-networking.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jlngdt'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LibSpirNetworking' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
