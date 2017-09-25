#
# Be sure to run `pod lib lint DNavAssistantSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DNavAssistantSDK'
  s.version          = '0.2.3'
  s.summary          = 'DNavAssistantSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    TODO: 基于BabyBluetooth的封装，用于RTK接收机数据的接受，及数据解析
                       DESC

  s.homepage         = 'https://github.com/GL-ZHU/DNavAssistantSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GL-ZHU' => 'caimter@163.com' }
  s.source           = { :git => 'https://github.com/GL-ZHU/DNavAssistantSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.vendored_frameworks = 'DNavAssistantSDK/Classes/DNavAssistantSDK_iOS.framework'
  s.dependency 'BabyBluetooth'
  # s.resource_bundles = {
  #   'DNavAssistantSDK' => ['DNavAssistantSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
