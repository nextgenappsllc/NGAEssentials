#
# Be sure to run `pod lib lint NGAEssentials.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NGAEssentials'
  s.version          = '0.1.0'
  s.summary          = 'Convenience methods and extensions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A bunch of convenience methods, extensions, and classes that I use in my projects.
                       DESC
                       
  s.homepage         = 'https://github.com/nextgenappsllc/NGAEssentials'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nextgenappsllc' => 'nextgenappsllc@gmail.com' }
   s.source           = { :git => 'https://github.com/nextgenappsllc/NGAEssentials.git', :tag => s.version.to_s }
  # s.source = {git: 'jose@localhost:swift/pods/NGAEssentials', :tag => s.version.to_s}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NGAEssentials/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NGAEssentials' => ['NGAEssentials/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'SystemConfiguration', 'CoreLocation', 'MapKit'
    s.dependency 'CryptoSwift', '~> 0.6'
end
