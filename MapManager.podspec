#
# Be sure to run `pod lib lint MapManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MapManager'
  s.version          = '1.0.1'
  s.summary          = 'The map the way it should be.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MapManager is an extension of MKMapView. From the same creator of TableManager and with the same goal, MapManager comes to help you to implement your map and pins easily.
                       DESC

  s.homepage         = 'https://github.com/Morbix'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Henrique Morbin' => 'morbin_@hotmail.com' }
  s.source           = { :git => 'https://github.com/OpenCraft/MapManager.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Morbin_'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MapManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MapManager' => ['MapManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
